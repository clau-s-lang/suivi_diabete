import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageAccueil.dart';

void main() {
  runApp(
      MaterialApp(
       /* theme: ThemeData(
          primaryColor: Color(0xA2CBFA),
          accentColor: Color.fromRGBO(166, 208, 255, 0),
        ),*/
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
