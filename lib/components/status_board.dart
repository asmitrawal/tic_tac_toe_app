// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tic_tac_toe_app/constants/constants.dart';

class StatusBoard extends StatelessWidget {
  final bool ohTurn;
  final String? winner;
  const StatusBoard({
    Key? key,
    required this.ohTurn,
    required this.winner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Constants.margin),
      child: winner!.isEmpty
          ? Text(
              ohTurn ? "O to play!" : "X to play!",
              style: TextStyle(fontSize: 20, letterSpacing: 5),
            )
          : Column(
              children: winner!.toLowerCase() != "draw"
                  ? [
                      Text(
                        "$winner WINS!",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Tap anywhere to play again!",
                        style: TextStyle(fontSize: 16),
                      ),
                    ]
                  : [
                      Text(
                        "It's a DRAW.",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Tap anywhere to play again!",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
            ),
    );
  }
}
