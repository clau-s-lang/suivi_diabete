import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../menus/pageMenuPatient.dart';
import '../users/pageLogin.dart';
//import 'package:gestion_diabete/pages/pageMenuPatient.dart';

import '../Reusables/BoutonDeConfimation.dart';
import '../Reusables/ChampDossierMed.dart';
import '../Reusables/EspaceVerticale.dart';
import '../Reusables/PlageIdentifiantData.dart';
import '../Reusables/ChampdeRedactionMessage.dart';

class DossierMedicalPat extends StatefulWidget {

  @override
  _DossierMedicalPatState createState() => _DossierMedicalPatState();
}

class _DossierMedicalPatState extends State<DossierMedicalPat> {
  //final insulinotherapie = TextEditingController();
  final insulinotherapieDepuis = TextEditingController();
  final allergie = TextEditingController();
  final vaccin = TextEditingController();
  final type = TextEditingController();
  final modeDeVie = TextEditingController();
  final obesite = TextEditingController();
  final hypertension = TextEditingController();
  final hypotroide = TextEditingController();
  final maladie = TextEditingController();
  final medicaux = TextEditingController();
  final chirurgicaux = TextEditingController();
  final tabac = TextEditingController();
  final alcool = TextEditingController();
  final sendentarite = TextEditingController();
  final cholesterol = TextEditingController();
  final heredite = TextEditingController();
  final cardio = TextEditingController();
  final items = ['Oui', 'Non'];

  String? value;
  String surpoids = 'Non';
  String insulinotherapie = 'Non';

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Mon dossier médical'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: ListView(
        children: [
          EspaceVerticale(),
          PlageDeDonnees(
            designation: 'DIABETE',
            icone: Icon(
              Icons.bloodtype_outlined,
              color: Color(0xFF216DAD),
            ),
          ),
          EspaceVerticale(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 10),
                child: Text(
                  'Insulinothérapie :',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        title: Text('Non', style: TextStyle(fontWeight: FontWeight.bold),),
                        leading: Radio<String>(
                          value: 'Non',
                          groupValue: insulinotherapie,
                          onChanged: (value) {
                            setState(() {
                              insulinotherapie = value!;
                            });
                          },
                          activeColor: Color(0xFF216DAD),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        title: Text('Oui', style: TextStyle(fontWeight: FontWeight.bold),),
                        leading: Radio<String>(
                          value: 'Oui',
                          groupValue: insulinotherapie,
                          onChanged: (value) {
                            setState(() {
                              insulinotherapie = value!;
                            });
                          },
                          activeColor: Color(0xFF216DAD),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: insulinotherapieDepuis,
            label: 'Insulinothérapie depuis',
            hint: 'Exemple : 2005',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: allergie,
            label: 'Allérgie',
            hint: 'Exemple : A la viande',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: vaccin,
            label: 'Vaccination',
            hint: 'BCG',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: modeDeVie,
            label: 'Mode de vie',
            hint: 'Exemple : moyen',
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 10),
                child: Text(
                  'Surpoids, obésité :',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ),
             Container(
              margin: EdgeInsets.only(left: 5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Expanded(
                     flex: 1,
                     child: ListTile(
                       contentPadding: EdgeInsets.zero,
                       horizontalTitleGap: 0,
                       title: Text('Non', style: TextStyle(fontWeight: FontWeight.bold),),
                       leading: Radio<String>(
                         value: 'Non',
                         groupValue: surpoids,
                         onChanged: (value) {
                           setState(() {
                             surpoids = value!;
                           });
                         },
                         activeColor: Color(0xFF216DAD),
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 3,
                     child: ListTile(
                       contentPadding: EdgeInsets.zero,
                       horizontalTitleGap: 0,
                       title: Text('Oui', style: TextStyle(fontWeight: FontWeight.bold),),
                       leading: Radio<String>(
                         value: 'Oui',
                         groupValue: surpoids,
                         onChanged: (value) {
                           setState(() {
                             surpoids = value!;
                           });
                         },
                         activeColor: Color(0xFF216DAD),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
            ],
          ),
          /*Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'Surpoids, obésité',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),*/
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        'Hypertension',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        'Hypothyroide',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),
          EspaceVerticale(),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        'Maladie coeliaque',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),
          EspaceVerticale(),
          PlageDeDonnees(
            designation: 'Antécédents',
            icone: Icon(
              Icons.bloodtype_outlined,
              color: Color(0xFF216DAD),
            ),
          ),
          EspaceVerticale(),
          ReusableTextFormFieldDossierOccaz(
            name: type,
            label: 'Médicaux',
            hint: 'Exemple : A la viande',
          ),
          EspaceVerticale(),
          ReusableTextFormFieldDossierOccaz(
            name: type,
            label: 'Chirurgicaux',
            hint: 'Exemple : A la viande',
          ),
          EspaceVerticale(),
          ReusableTextFormFieldDossierOccaz(
            name: type,
            label: 'Famillicaux',
            hint: 'Exemple : A la viande',
          ),
          EspaceVerticale(),
          PlageDeDonnees(
            designation: 'Facteurs de risque',
            icone: Icon(
              Icons.bloodtype_outlined,
              color: Color(0xFF216DAD),
            ),
          ),
          EspaceVerticale(),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        'Tabagisme',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),
          EspaceVerticale(),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        'Alcool',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),
          EspaceVerticale(),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        'Sédentarité',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),
          EspaceVerticale(),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        'Cholesterol',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),
          EspaceVerticale(),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        'Hérédité',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),
          EspaceVerticale(),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        'Cardio-vasculaire',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),
          EspaceVerticale(),
          ReusableButton(
            text: 'Enregistrer les modifications',
            ToPage: Connexion(),
            dim: 200,
          ),
          EspaceVerticale(),
        ],
      ),
    );
  }
}
