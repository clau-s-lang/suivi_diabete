import 'package:flutter/material.dart';

Widget ordonnanceTile(
    {required String designation, required String posologie, routing}) {
  return Card(
    child: ListTile(
      title: Text("$designation"),
      subtitle: Text("$posologie"),
      onTap: routing,
    ),
  );
}
