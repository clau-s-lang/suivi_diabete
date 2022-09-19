import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  ReusableTextFormField({
    required this.name,
    required this.hint,
    required this.label,
    required this.message,
    required this.icone,
    required this.type,
  });

  final TextEditingController name;
  String message, label, hint;
  IconData icone;
  TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      child: TextFormField(
        controller: name,
        style: TextStyle(
          fontSize: 15,
          height: 0.5,
        ),
         validator: (value) =>
        value == null  ? message : null,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: Icon(icone,
            size: 30.0, color: Color(0xFFA2CCF9),),
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}