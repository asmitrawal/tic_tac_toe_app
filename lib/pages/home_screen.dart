import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe_app/components/custom_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
      ),
      backgroundColor: Colors.blueGrey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo
            Image.asset(
              "assets/tic_tac_toe.png",
              height: 125,
              width: 125,
            ),
            SizedBox(
              height: 20,
            ),

            //title
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "TIC TAC TOE",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ), //created by
                Text(
                  "CREATED BY NARCO",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 100,
            ),

            //button 2P
            CustomButton(buttonText: "PLAY 2P", iconData: Icons.people),
            SizedBox(
              height: 20,
            ),

            //button multiplayer
            CustomButton(
              buttonText: "MULTIPLAYER",
              iconData: Icons.groups_2,
            ),
          ],
        ),
      ),
    );
  }
}
