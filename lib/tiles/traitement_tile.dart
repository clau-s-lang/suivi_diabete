import 'package:flutter/material.dart';

Widget traitementTile(
    {required String designation,
      required String posologie,
      required String datedeFin,
      }) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Card(
      child: ListTile(
        // leading: CircleAvatar(child: Text(name[0])),
        title: Text("$designation"),
        subtitle: Text("$posologie"),
        trailing: Text("$datedeFin"),
      ),
    ),
  );
}