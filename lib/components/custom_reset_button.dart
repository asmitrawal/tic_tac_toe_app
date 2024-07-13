// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class CustomResetButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const CustomResetButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: Constants.paddingHor),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              Transform.translate(
                offset: Offset(0, 2),
                  child: Text("$text", style: TextStyle(fontSize: 16))),
            ],
          ),
        ),
      ),
    );
  }
}
