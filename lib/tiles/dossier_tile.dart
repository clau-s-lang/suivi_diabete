import 'package:flutter/material.dart';

Widget dossierTile(
    { routing}) {
  return Card(
    child: ListTile(
      leading: Container(
        margin: EdgeInsets.all(5),
        child: CircleAvatar(
          radius:50,
          backgroundColor: Color(0xFFE8F0FE),
          backgroundImage: AssetImage('images/doss.png'),
        ),
      ),
      onTap: routing,
    ),
  );
}