import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageAccueil.dart';

void main() {
  runApp(
      MaterialApp(
        home:SuiviDiabete(),
      ),
  );
}

class SuiviDiabete extends StatefulWidget {
  @override
  _SuiviDiabeteState createState() => _SuiviDiabeteState();
}

class _SuiviDiabeteState extends State<SuiviDiabete> {
  @override
  Widget build(BuildContext context) {
    return PageAccueil();
  }
}
