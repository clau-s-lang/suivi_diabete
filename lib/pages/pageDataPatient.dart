import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageMenuPatient.dart';

class DonneesPatient extends StatefulWidget {
  @override
  _DonneesPatientState createState() => _DonneesPatientState();
}

class _DonneesPatientState extends State<DonneesPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('ESSAI'),

      ),
    );
  }
}
