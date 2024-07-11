// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tic_tac_toe_app/constants/constants.dart';

class CustomResetButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomResetButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Constants.paddingHor),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Constants.paddingHor, vertical: Constants.paddingVer),
          decoration: BoxDecoration(
            color: Color(0xFFdab5c3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.refresh_rounded,
                size: 24,
              ),
              SizedBox(width: 10),
              Text("RESET", style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
