import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageLogin.dart';
import 'package:gestion_diabete/pages/pageMenuPatient.dart';

import '../Constants/Reusables.dart';

class DonneesPatient extends StatefulWidget {
  @override
  _DonneesPatientState createState() => _DonneesPatientState();
}

class _DonneesPatientState extends State<DonneesPatient> {
  final glycemie = TextEditingController();
  final insulineBasale = TextEditingController();
  final insulineBolus = TextEditingController();
  final insulineCorr = TextEditingController();
  final duree = TextEditingController();
  final nbrePas = TextEditingController();
  final poids = TextEditingController();
  final hba1c = TextEditingController();
  final PAsyst = TextEditingController();
  final PAdiast = TextEditingController();

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
            name: insulineBasale,
            message: 'Ce champ est obligatoire',
            label: 'Insuline basale',
            hint: 'Exemple : 2.5 U',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldData(
            name: insulineBolus,
            message: 'Ce champ est obligatoire',
            label: 'Insuline bolus',
            hint: 'Exemple : 2.5 U',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldData(
            name: insulineCorr,
            message: 'Ce champ est obligatoire',
            label: 'Insuline de correction',
            hint: 'Exemple : 2.5 U',
          ),
          SizedBox(
            height: 10,
          ),
          PlageDeDonnees(
            icone: Icon(Icons.snowshoeing_outlined, color: Color(0xFF216DAD)),
            designation: 'ACTIVITE PHYSIQUE',
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconDemo(
                image: 'images/muscu.PNG',
                designation: 'Muscu',
              ),
              SizedBox(
                width: 10,
              ),
              IconDemo(
                image: 'images/clau.jpg',
                designation: 'Sport collectif',
              ),
              SizedBox(
                width: 10,
              ),
              IconDemo(
                image: 'images/cardio.PNG',
                designation: 'Cardio',
              ),
              SizedBox(
                width: 10,
              ),
              IconDemo(
                image: 'images/clau.jpg',
                designation: 'Marche',
              ),
            ],
          ),
          SizedBox(height: 10,),
          PlageDeDescription(
            designation: 'Description',
          ),
          SizedBox(height: 10,),
          ReusableTextFormFieldDossierOccaz(
            name: duree,
            label: 'Durée',
            hint: 'Exemple : 2:30 hh:mm',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: nbrePas,
            label: 'Nombre de pas',
            hint: 'Exemple :  100 pas',
          ),
          SizedBox(height: 10,),
          PlageDeDonnees(
            icone: Icon(Icons.edit_note_outlined, color: Color(0xFF216DAD)),
            designation: 'CONTEXTE',
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconDemo(
                image: 'images/clau.jpg',
                designation: 'Stress',
              ),
              SizedBox(
                width: 10,
              ),
              IconDemo(
                image: 'images/clau.jpg',
                designation: 'Maladie',
              ),
              SizedBox(
                width: 10,
              ),
              IconDemo(
                image: 'images/clau.jpg',
                designation: 'Allérgie',
              ),
            ],
          ),
          SizedBox(height: 10,),
          PlageDeDonnees(
            icone: Icon(Icons.edit_note_outlined, color: Color(0xFF216DAD)),
            designation: 'OCCASIONNEL',
          ),
          SizedBox(height: 10,),
          ReusableTextFormFieldDossierOccaz(
            name: poids,
            label: 'Poids',
            hint: 'Exemple : 65.5 Kg',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: hba1c,
            label: 'HbA1c',
            hint: 'Exemple : 7.0 ',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: PAsyst,
            label: 'Pression Arterielle syst.',
            hint: 'Exemple : 2.5 U',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: PAdiast,
            label: 'Pression Arterielle diast',
            hint: 'Exemple : 2.5 U',
          ),
          SizedBox(
            height: 10,
          ),
          PlageDeDonnees(
            icone: Icon(Icons.edit_note_outlined, color: Color(0xFF216DAD)),
            designation: 'REMARQUES',
          ),
          SizedBox(height: 10,),
          ReusableTextFormFieldDossierOccaz(
            name: PAdiast,
            label: 'Remarques',
            hint: 'Exemple: J\'ai constaté que ...',
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableButton(
                text: 'Annuler' ,
                ToPage:  Connexion(),
                dim: 150,
              ),
              SizedBox(width: 10,),
              ReusableButton(
                text: 'Envoyer' ,
                ToPage:  Connexion(),
                dim: 150,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
