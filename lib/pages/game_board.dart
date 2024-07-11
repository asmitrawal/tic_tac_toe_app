import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/components/custom_home_button.dart';
import 'package:tic_tac_toe_app/components/custom_reset_button.dart';
import 'package:tic_tac_toe_app/components/grid_box.dart';
import 'package:tic_tac_toe_app/components/score_board.dart';
import 'package:tic_tac_toe_app/constants/constants.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> gridValues = List.filled(9, '');
  bool ohTurn = true;
  String? winner = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Transform.translate(
            offset: const Offset(0,5),
            child: Text(
              "Tic Tac Toe",
              style: TextStyle(
                fontSize: 36,
                letterSpacing: 2,
                color: Color(0xFFdab5c3)
              ),
            ),
          ),
          centerTitle: true,
          leading: CustomHomeButton(),
          backgroundColor: Color(0xFFb56b86),
          //Color(0xFF751337)
        ),
        backgroundColor: Color(0xFFb56b86),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            ScoreBoard(),
            SizedBox(height: 40),
            Flexible(
              child: buildGrid(context),
            ),
            SizedBox(height: 40),
            CustomResetButton(onTap: resetBoard),
            Text("winner: $winner"),
          ],
        ));
  }

  Widget buildGrid(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Constants.margin),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GridBox(
            text: gridValues[index],
            onTap: () {
              setState(() {
                gridValues[index] = printExOrOh(gridValue: gridValues[index]);
                checkWinCondition();
              });
            },
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

  void resetBoard() {
    setState(() {});
    gridValues = List.filled(9, '');
    ohTurn = true;
    winner = '';
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
        break;
      case _ when regExpEx.hasMatch(boardPattern):
        winner = "X";
        break;
      default:
        if (!gridValues.contains("") && winner != "X" && winner != "O")
          winner = "DRAW";
    }
  }
}
