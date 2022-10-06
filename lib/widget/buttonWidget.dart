import 'package:flutter/material.dart';

Card buttonWidget({String label = '', IconData? iconData, onPressed}) {
  return Card(
    color: Colors.white,
    margin: const EdgeInsets.all(5.0),
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(iconData, color: Colors.black54,),
            SizedBox(width: 10,),
            Text(label, style: TextStyle(color: Colors.black87, fontSize: 15), textAlign: TextAlign.center,),
          ],
        ),
      ),
    ),
  );
}

