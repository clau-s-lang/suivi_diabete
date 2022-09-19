import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/Reusables/EspaceVerticale.dart';
import 'package:gestion_diabete/pages/pageDataPatient.dart';
import 'package:gestion_diabete/pages/pageMenuMedecin.dart';
import '../Reusables/AjoutSuppression.dart';
import '../Reusables/BoutonDeConfimation.dart';
import '../Reusables/ChampData.dart';
import '../Reusables/ChampOrdonnance.dart';
import '../Reusables/IdentifiantOrdonance.dart';

class PrescriptionMed extends StatefulWidget {
  @override
  _PrescriptionMedState createState() => _PrescriptionMedState();
}

class _PrescriptionMedState extends State<PrescriptionMed> {
  final ordonance = TextEditingController();
  final posologie = TextEditingController();
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
          Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Center(
                  child: Text(
                    'E-Diab Health Care Service',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              IdOrdonnance(
                variable: 'Patient : ',
                valeur: 'Claudette Vanzirwe',
              ),
              SizedBox(
                height: 10,
              ),
              IdOrdonnance(
                variable: 'Age : ',
                valeur: '24' + 'ans',
              ),
              SizedBox(
                height: 10,
              ),
              IdOrdonnance(variable: 'Date : ', valeur: '24/08/2022'),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                    '------------------------------------------------------------------------------------'),
              ),
            ],
          ),
         EspaceVerticale(),
          ChampOrdannance(
            ordonance: ordonance,
            posologie: posologie,
            label: 'Designation',
            hint: 'Exemple : Paracétamol',
            message: 'Vous ne pouvez pas envoyer un formulaire vide',
          ),
         EspaceVerticale(),

             AjoutSuppression(
                icone: Icon(
                  Icons.add_circle_outline_outlined,
                  color: Color(0xFFA2CCF9),
                  size: 15,
                ),
                designation: 'Ajouter',
            couleur: Color(0xFFA2CCF9),),
          EspaceVerticale(),
          Column(
            children: [
              IdOrdonnance(variable: 'Médecin : ', valeur: 'Queen Mughole'),
              SizedBox(
                height: 10,
              ),
              IdOrdonnance(variable: 'Signature : ', valeur: 'signature')
            ],
          ),
         EspaceVerticale(),
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
