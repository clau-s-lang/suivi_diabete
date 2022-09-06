import 'package:flutter/material.dart';

class ReusableMenuName extends StatelessWidget {
  ReusableMenuName(this.text);

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsetsDirectional.only(top: 20, bottom: 10, start: 10),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}