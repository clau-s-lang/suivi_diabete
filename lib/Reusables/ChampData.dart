import 'package:flutter/material.dart';

class ReusableTextFormFieldData extends StatelessWidget {
  ReusableTextFormFieldData({
    required this.name,
    required this.hint,
    required this.label,
    required this.message,

  });

  final TextEditingController name;
  String message, label, hint;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: 300,
      child: TextFormField(
        controller: name,
        style: TextStyle(
          fontSize: 15,
          height: 0.5,
        ),
        validator: (value) =>
        value == null ? message : null,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}