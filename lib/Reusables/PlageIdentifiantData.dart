import 'package:flutter/material.dart';

class PlageDeDonnees extends StatelessWidget {
  PlageDeDonnees({
    required this.designation,
    required this.icone,
  });

  String designation;
  Icon icone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3, right: 3),
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0FE),
      ),
      height: 50,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icone,
          SizedBox(width: 5,),
          Text(
            designation,
            style: TextStyle(
              color: Color(0xFF216DAD),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}