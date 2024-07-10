// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final IconData iconData;
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: EdgeInsets.symmetric(
            horizontal: Constants.paddingHor, vertical: Constants.paddingVer),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 24,
            ),
            SizedBox(width: 10),
            Text(buttonText, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
