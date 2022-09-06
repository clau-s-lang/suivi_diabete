import 'package:flutter/material.dart';

class PlageDeDescription extends StatelessWidget {
  PlageDeDescription({
    required this.designation,
  });

  String designation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      decoration: const BoxDecoration(
        color: Color(0xFFF6F5F7),
      ),
      height: 50,
      width: 330,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            designation,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}