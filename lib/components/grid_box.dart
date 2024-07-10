// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GridBox extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const GridBox({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
