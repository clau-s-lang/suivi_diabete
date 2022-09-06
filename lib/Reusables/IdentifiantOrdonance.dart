import 'package:flutter/material.dart';

class IdOrdonnance extends StatelessWidget {
  IdOrdonnance({
    required this.variable,
    required this.valeur,
  });

  String variable, valeur;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 100),
          child: Text(variable),
        ),
        Container(
          child: Text(valeur),
        ),
      ],
    );
  }
}
