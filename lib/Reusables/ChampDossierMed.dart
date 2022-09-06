import 'package:flutter/material.dart';

class ReusableTextFormFieldDossierOccaz extends StatelessWidget {
  ReusableTextFormFieldDossierOccaz({
    required this.name,
    required this.label,
    required this.hint,
  });

  final TextEditingController name;
  String label,hint;


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