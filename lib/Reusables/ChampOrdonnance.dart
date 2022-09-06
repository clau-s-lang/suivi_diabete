import 'package:flutter/material.dart';

import 'ChampData.dart';

class ChampOrdannance extends StatelessWidget {
  ChampOrdannance({
    required this.ordonance,
    required this.posologie,
    required this.label,
    required this.hint,
    required this.message,
  }) ;

  final TextEditingController ordonance;
  final TextEditingController posologie;
  String label, hint,message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReusableTextFormFieldData(
          name: ordonance,
          label: label,
          hint: hint,
          message: message,
        ),
        SizedBox(
          height: 10,
        ),
        ReusableTextFormFieldData(
          name: posologie,
          label: 'Posologie',
          hint: 'Exemple : 3x2Co',
          message: 'Vous ne pouvez pas envoyer un formulaire vide',
        ),
      ],
    );
  }
}