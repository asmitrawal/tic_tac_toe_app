import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_app/components/custom_home_button.dart';
import 'package:tic_tac_toe_app/components/custom_reset_button.dart';
import 'package:tic_tac_toe_app/components/grid_box.dart';
import 'package:tic_tac_toe_app/components/score_board.dart';
import 'package:tic_tac_toe_app/components/status_board.dart';
import 'package:tic_tac_toe_app/constants/constants.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  //elements of grid
  List<String> gridValues = List.filled(9, '');

  //to track turns
  bool ohTurn = true;

  //to track winner
  String? winner = '';

  //for scoreboard
  int ohWins = 0;
  int exWins = 0;
  int draws = 0;

  //to avoid multiple taps during 300ms delay
  bool isResetting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Transform.translate(
            offset: const Offset(0, 5),
            child: Text(
              "Tic Tac Toe",
              style: TextStyle(
                  fontSize: 36, letterSpacing: 2, color: Color(0xFFdab5c3)),
            ),
          ),
          centerTitle: true,
          leading: CustomHomeButton(),
          backgroundColor: Color(0xFFb56b86),
          //Color(0xFF751337)
        ),
        backgroundColor: Color(0xFFb56b86),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: winner!.isNotEmpty && !isResetting
              ? () {
                  resetBoard();
                }
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    ScoreBoard(
                      ohWins: ohWins,
                      exWins: exWins,
                      draws: draws,
                    ),
                    SizedBox(height: 20),
                    Stack(
                      children: [
                        buildGrid(context),
                        buildEraser(context),
                      ],
                    ),
                    SizedBox(height: 5),
                    StatusBoard(
                      ohTurn: ohTurn,
                      winner: winner,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Constants.margin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomResetButton(text: "RESET", onTap: resetBoard),
                    CustomResetButton(text: "HARD RESET", onTap: hardResetBoard),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  Widget buildGrid(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Constants.margin),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // crossAxisSpacing: 6,
          // mainAxisSpacing: 6,
        ),
        itemBuilder: (context, index) {
          return GridBox(
            index: index,
            text: gridValues[index],
            onTap: winner!.isEmpty
                ? () {
                    setState(() {
                      gridValues[index] =
                          printExOrOh(gridValue: gridValues[index]);
                      checkWinCondition();
                    });
                  }
                : null,
          );
        },
        itemCount: 9,
      ),
    );
  }

  //print X or O when tapped, only if its not already tapped
  String printExOrOh({required String gridValue}) {
    if (gridValue.isEmpty) {
      if (ohTurn) {
        switchTurns();
        return "O";
      } else {
        switchTurns();
        return "X";
      }
    } else {
      return gridValue;
    }
  }

  //seperate function to switch turns because only switch turn if value is printed
  void switchTurns() {
    ohTurn = !ohTurn;
  }

  Future<void> resetBoard() async {
    if (!isResetting) {
      setState(() {});
      isResetting = true;
      await Future.delayed(Duration(milliseconds: 300));
      setState(() {});
      gridValues = List.filled(9, '');
      ohTurn = true;
      winner = '';

      //animation remains a little longer after board is cleaned
      await Future.delayed(Duration(milliseconds: 600));
      setState(() {});
      isResetting = false;
    }
  }

  Future<void> hardResetBoard() async {
    if (!isResetting) {
      setState(() {});
      isResetting = true;
      await Future.delayed(Duration(milliseconds: 300));
      setState(() {});

      gridValues = List.filled(9, '');
      ohTurn = true;
      winner = '';
      ohWins = 0;
      exWins = 0;
      draws = 0;

      await Future.delayed(Duration(milliseconds: 600));
      setState(() {});

      isResetting = false;
    }
  }

  //use of regExp instad of if-else
  void checkWinCondition() {
    String boardPattern = "";
    for (String? value in gridValues) {
      boardPattern += value!.isEmpty ? "*" : value;
    }
    final regExpOh = RegExp(
        r'^OOO......|...OOO...|......OOO|O..O..O..|.O..O..O.|..O..O..O|O...O...O|..O.O.O..$');
    final regExpEx = RegExp(
        r'^XXX......|...XXX...|......XXX|X..X..X..|.X..X..X.|..X..X..X|X...X...X|..X.X.X..$');
    switch (boardPattern) {
      case _ when regExpOh.hasMatch(boardPattern):
        winner = "O";
        ohWins += 1;
        break;
      case _ when regExpEx.hasMatch(boardPattern):
        winner = "X";
        exWins += 1;
        break;
      default:
        if (!gridValues.contains("") && winner != "X" && winner != "O") {
          winner = "DRAW";
          draws += 1;
        }
        break;
    }

    if (ohWins == 3 || exWins == 3) {
      showWinDialog(winner: winner);
    }
  }

  //shows after 3 wins
  showWinDialog({required String? winner}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("FIRST TO 3 RESULTS"),
          backgroundColor: Color(0xFFb56b86),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$winner WINS!",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                "GOOD GAME!",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                hardResetBoard();
                return Navigator.of(context).pop();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Color(0xFFdab5c3),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text("PLAY AGAIN")),
            )
          ],
        );
      },
    );
  }

  Widget buildEraser(BuildContext context) {
    if (isResetting) {
      return Positioned.fill(
          child: Lottie.asset(
        "assets/cleaner.json",
      ));
    } else {
      return Center();
    }
  }
}
