import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[300],
        ),
        backgroundColor: Colors.blueGrey[300],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScoreBoard(),
            Flexible(
              child: buildGrid(context),
            ),
            SizedBox(
              height: 10,
            ),
            CustomResetButton(
              onTap: resetBoard,
            ),
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
              setState(() {});
              gridValues[index] = printExOrOh(gridValue: gridValues[index]);
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
  }
}
