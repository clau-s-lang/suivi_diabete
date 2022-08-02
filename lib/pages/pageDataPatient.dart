import 'package:flutter/cupertino.dart';
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
          SizedBox(
            height: 10,
          ),
          PlageDeDonnees(
            designation: 'GLYCEMIE',
            icone: Icon(
              Icons.bloodtype_outlined,
              color: Color(0xFF216DAD),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldData(
            name: glycemie,
            message: 'Ce champ est obligatoire',
            label: 'Glycemie',
            hint: 'Exemple : 2.5 g/l',
          ),
          SizedBox(
            height: 10,
          ),
          PlageDeDonnees(
            icone: Icon(Icons.star, color: Color(0xFF216DAD)),
            designation: 'INSULINE',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldData(
            name: glycemie,
            message: 'Ce champ est obligatoire',
            label: 'Insuline basale',
            hint: 'Exemple : 2.5 U',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldData(
            name: glycemie,
            message: 'Ce champ est obligatoire',
            label: 'Insuline bolus',
            hint: 'Exemple : 2.5 U',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldData(
            name: glycemie,
            message: 'Ce champ est obligatoire',
            label: 'Insuline de correction',
            hint: 'Exemple : 2.5 U',
          ),
          SizedBox(
            height: 10,
          ),
          PlageDeDonnees(
            icone: Icon(Icons.star, color: Color(0xFF216DAD)),
            designation: 'ACTIVITE PHYSIQUE',
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage('images/clau.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      'Muscu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
