// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tic_tac_toe_app/constants/constants.dart';

class ScoreBoard extends StatelessWidget {
  final int ohWins;
  final int exWins;
  final int draws;
  const ScoreBoard({
    Key? key,
    required this.ohWins,
    required this.exWins,
    required this.draws,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Constants.margin),
      child: Column(
        children: [
          Text(
            "SCOREBOARD",
            style: TextStyle(fontSize: 32, color: Color(0xFFdab5c3)),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              ScoreTile(
                icon: Icons.circle_outlined,
                text: "$ohWins/3 Wins",
              ),
              ScoreTile(
                icon: Icons.close,
                text: "$exWins/3 Wins",
              ),
              ScoreTile(
                icon: Icons.balance_rounded,
                text: "$draws Draws",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ScoreTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const ScoreTile({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
          child: Column(
        children: [
          //symbol
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(
            height: 10,
          ),

          //text
          Text(
            text,
            style: TextStyle(fontSize: 15),
          )
        ],
      )),
    );
  }
}
