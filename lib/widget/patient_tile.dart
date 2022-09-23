import 'package:flutter/material.dart';

Widget patientTile(
    {required String photo,
    required String name,
    required String type_diabete,
    routing}) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage("$photo"),
      ),
      title: Text("$name"),
      subtitle: Text("$type_diabete"),
      onTap: routing,
    ),
  );
}
