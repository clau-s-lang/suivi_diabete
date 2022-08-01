import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageMenuPatient.dart';

import '../modeles/Reusables.dart';

class DonneesPatient extends StatefulWidget {
  @override
  _DonneesPatientState createState() => _DonneesPatientState();
}

class _DonneesPatientState extends State<DonneesPatient> {

  final glycemie = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Ajouter des données'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE8F0FE),
            ),
            height: 50,
            width: 330,
            child: Center(
              child: Text(
                'GLYCEMIE',
                style: TextStyle(
                  //color: Color(0xFF216DAD),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          ReusableTextFormField(
            name: glycemie,
            message: 'Ce champ est obligatoire',
            label: 'Glycemie',
            hint: '2.5 g/l',
            icone: (Icons.bloodtype),
          ),
        ],
      ),
    );
  }
}
