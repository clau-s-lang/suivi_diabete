import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageDataPatient.dart';
import 'package:gestion_diabete/pages/pageMenuMedecin.dart';

import '../Constants/Reusables.dart';

class PrescriptionMed extends StatefulWidget {
  @override
  _PrescriptionMedState createState() => _PrescriptionMedState();
}

class _PrescriptionMedState extends State<PrescriptionMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuMedecin(),
      appBar: AppBar(
        title: Text('Prescription Médicale'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: ListView(
        children: [
          Container(
            child: Text(
              ''
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ReusableButton(
            text: 'Envoyer',
            ToPage: DonneesPatient(),
            dim: 200,
          ),
        ],
      ),
    );
  }
}
