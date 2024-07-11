// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/constants/constants.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Constants.margin),
      child: Column(
        children: [
          Text(
            "SCOREBOARD",
            style: TextStyle(fontSize: 32,color: Color(0xFFdab5c3)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              SquareTile(
                icon: Icons.circle_outlined,
                text: "0/3 Wins",
              ),
              SquareTile(
                icon: Icons.close,
                text: "0/3 Wins",
              ),
              SquareTile(
                icon: Icons.balance_rounded,
                text: "0 Draws",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SquareTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const SquareTile({
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
