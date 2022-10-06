import 'package:flutter/material.dart';

Widget patientTile(
    {required String sname,
    required String name,
    required String email,
    routing}) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(child: Text(name[0])),
      title: Text("$name"),
      subtitle: Text("$email"),
      onTap: routing,
    ),
  );
}
