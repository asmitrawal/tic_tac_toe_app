// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GridBox extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final int index;
  const GridBox({
    Key? key,
    required this.text,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderDirectional customBorder;
    switch (index) {
      case 0:
        customBorder = BorderDirectional(
          end: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
        break;
      case 1:
        customBorder = BorderDirectional(
          start: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          end: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
        ;
        break;
      case 2:
        customBorder = BorderDirectional(
          start: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
        ;
        break;
      case 3:
        customBorder = BorderDirectional(
          end: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          top: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
        ;
        break;
      case 4:
        customBorder = BorderDirectional(
          start: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          end: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          top: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
        ;
        break;
      case 5:
        customBorder = BorderDirectional(
          start: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          top: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
        ;
        break;
      case 6:
        customBorder = BorderDirectional(
          end: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          top: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
        ;
        break;
      case 7:
        customBorder = BorderDirectional(
          start: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          end: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          top: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
        ;
        break;
      case 8:
        customBorder = BorderDirectional(
          start: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          top: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
        ;
        break;
      default:
        customBorder = BorderDirectional(
          end: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
        ;
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFb56b86),
          border: customBorder,
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
