import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageLogin.dart';
import 'package:gestion_diabete/pages/pageMenuPatient.dart';

import '../Reusables/BoutonDeConfimation.dart';
import '../Reusables/ChampDossierMed.dart';
import '../Reusables/EspaceVerticale.dart';
import '../Reusables/PlageIdentifiantData.dart';
import '../Reusables/ChampdeRedactionMessage.dart';

class DossierMedical extends StatefulWidget {
  @override
  _DossierMedicalState createState() => _DossierMedicalState();
}

class _DossierMedicalState extends State<DossierMedical> {
  final type = TextEditingController();

  final items = ['Oui', 'Non'];

  String? value;

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
            designation: 'GLYCEMIE',
            icone: Icon(
              Icons.bloodtype_outlined,
              color: Color(0xFF216DAD),
            ),
          ),
          EspaceVerticale(),
          ReusableTextFormFieldDossierOccaz(
            name: type,
            label: 'Type de diabète',
            hint: 'Exemple : DT2',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: type,
            label: 'Année du diagnostic',
            hint: '2002',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: type,
            label: 'Mode de découverte',
            hint: 'Exemple : en hospitalisation',
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
                    Container(
                      child: Text(
                        'Insulinothérapie',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                value: value,
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
          ReusableTextFormFieldDossierOccaz(
            name: type,
            label: 'Insulinothérapie depuis',
            hint: 'Exemple : 2005',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: type,
            label: 'Allérgie',
            hint: 'Exemple : A la viande',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: type,
            label: 'Vaccination',
            hint: 'BCG',
          ),
          SizedBox(
            height: 10,
          ),
          ReusableTextFormFieldDossierOccaz(
            name: type,
            label: 'Mode de vie',
            hint: 'Exemple : moyen',
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
                        'Age',
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
