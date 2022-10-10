import 'package:flutter/material.dart';

Widget signeTile(
    {required String glycemie,routing}) {
  return Card(
    child: ListTile(
      title: Text("Glycémie"),
      subtitle: Text("$glycemie"),
      trailing: CircleAvatar(
        radius: 7.0,
        backgroundColor: Colors.green,
        child:Text(
          '',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: routing,
    ),
  );
}