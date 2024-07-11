import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/pages/home_screen.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
          (route) {
            return false;
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
            height: 5,
            child: Image.asset(
              "assets/tic_tac_toe.png",
              color: Color(0xFFdab5c3),
            )),
      ),
    );
  }
}
