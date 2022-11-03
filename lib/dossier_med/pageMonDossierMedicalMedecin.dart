import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_diabete/menus/pageMenuMedecin.dart';
import 'package:gestion_diabete/modeles/modelDossierMed.dart';
import 'package:provider/provider.dart';
import '../api/apiProvider.dart';
import '../complication/CompleterComplication.dart';
import '../users/pageInscriptionMedecin.dart';
import '../Reusables/ChampDossierMed.dart';
import '../Reusables/EspaceVerticale.dart';
import '../Reusables/PlageIdentifiantData.dart';
import '../widget/pageloading.dart';

class DossierMedicalPat extends StatefulWidget {
  final String patientId;

  const DossierMedicalPat({Key? key, required this.patientId})
      : super(key: key);

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
 // final obesite = TextEditingController();
  String hypertension = 'Non';
  String hypotroide = 'Non';
  String maladie = 'Non';
  final medicaux = TextEditingController();
  final chirurgicaux = TextEditingController();
  final familliaux = TextEditingController();
  String tabac = 'Non';
  String alcool = 'Non';
  String sedentarite = 'Non';
  String cholesterol = 'Non';
  String heredite = 'Non';
  String cardio = 'Non';

  String surpoids = 'Non';
  String insulinotherapie = 'Non';

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            drawer: MenuMedecin(),
            appBar: AppBar(
              title: Text('Mon dossier médical'),
              backgroundColor: Color(0xFF216DAD),
            ),
            body: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Patient')
                    .doc(widget.patientId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.none) {
                    return Material(
                        child: Center(
                            child: Text('Veuillez vous connecter à internet')));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Material(
                        child: Center(child: CircularProgressIndicator()));
                  }
                  print(widget.patientId);
                  if (!snapshot.hasData) {
                    return Material(
                      child: Center(
                        child: Text('Pas de données'),
                      ),
                    );
                  }
                  DocumentSnapshot doc = snapshot.data!;

                  return Form(
                    key: _formKey,
                    child: ListView(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
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
                                'Hypertention :',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Non',
                                        groupValue: hypertension,
                                        onChanged: (value) {
                                          setState(() {
                                            hypertension = value!;
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Oui',
                                        groupValue: hypertension,
                                        onChanged: (value) {
                                          setState(() {
                                            hypertension = value!;
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 10),
                              child: Text(
                                'Hypothyroide:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Non',
                                        groupValue: hypotroide,
                                        onChanged: (value) {
                                          setState(() {
                                            hypotroide = value!;
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Oui',
                                        groupValue: hypotroide,
                                        onChanged: (value) {
                                          setState(() {
                                            hypotroide = value!;
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
                                'Maladie coeliaque:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Non',
                                        groupValue: maladie,
                                        onChanged: (value) {
                                          setState(() {
                                            maladie = value!;
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Oui',
                                        groupValue: maladie,
                                        onChanged: (value) {
                                          setState(() {
                                            maladie = value!;
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
                          name: medicaux,
                          label: 'Médicaux',
                          hint: 'Exemple : A la viande',
                        ),
                        EspaceVerticale(),
                        ReusableTextFormFieldDossierOccaz(
                          name: chirurgicaux,
                          label: 'Chirurgicaux',
                          hint: 'Exemple : A la viande',
                        ),
                        EspaceVerticale(),
                        ReusableTextFormFieldDossierOccaz(
                          name: familliaux,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 10),
                              child: Text(
                                'Tabagisme :',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Non',
                                        groupValue: tabac,
                                        onChanged: (value) {
                                          setState(() {
                                            tabac = value!;
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Oui',
                                        groupValue: tabac,
                                        onChanged: (value) {
                                          setState(() {
                                            tabac = value!;
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
                                'Alcool :',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Non',
                                        groupValue: alcool,
                                        onChanged: (value) {
                                          setState(() {
                                            alcool = value!;
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Oui',
                                        groupValue: alcool,
                                        onChanged: (value) {
                                          setState(() {
                                            alcool = value!;
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
                                'Sedentarité :',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Non',
                                        groupValue: sedentarite,
                                        onChanged: (value) {
                                          setState(() {
                                            sedentarite = value!;
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Oui',
                                        groupValue: sedentarite,
                                        onChanged: (value) {
                                          setState(() {
                                            sedentarite = value!;
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
                                'Cholesterol :',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Non',
                                        groupValue: cholesterol,
                                        onChanged: (value) {
                                          setState(() {
                                            cholesterol = value!;
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Oui',
                                        groupValue: cholesterol,
                                        onChanged: (value) {
                                          setState(() {
                                            cholesterol = value!;
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
                                'Heredité :',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Non',
                                        groupValue: heredite,
                                        onChanged: (value) {
                                          setState(() {
                                            heredite = value!;
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Oui',
                                        groupValue: heredite,
                                        onChanged: (value) {
                                          setState(() {
                                            heredite = value!;
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
                                'Cardio-vasculaire :',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        'Non',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Non',
                                        groupValue: cardio,
                                        onChanged: (value) {
                                          setState(() {
                                            cardio = value!;
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
                                      title: Text(
                                        'Oui',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Radio<String>(
                                        value: 'Oui',
                                        groupValue: cardio,
                                        onChanged: (value) {
                                          setState(() {
                                            cardio = value!;
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
                        EspaceVerticale(),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              try {
                                setState(() {
                                  loading = true;
                                });
                                final doss = DossierMedical(
                                    idPatient: widget.patientId,
                                    idMedecin: auth.currentUser!.uid,
                                    insulinotherapie: insulinotherapie,
                                    insulinotherapieDepuis:
                                        insulinotherapieDepuis.text,
                                    allergie: allergie.text,
                                    vaccination: vaccin.text,
                                    modeDeVie: modeDeVie.text,
                                    surpoids: surpoids,
                                    hypertension: hypertension,
                                    hypotroide: hypotroide,
                                    maladieCoeliaque: maladie,
                                    antecedentMedicaux: medicaux.text,
                                    antecedentChirurgicaux: chirurgicaux.text,
                                    antecedentFamilliaux: familliaux.text,
                                    tabagisme: tabac,
                                    alcool: alcool,
                                    sendentarite: sedentarite,
                                    cholesterol: cholesterol,
                                    heredite: heredite,
                                    cardiovasculare: cardio);
                                final provider = Provider.of<ProviderApi>(
                                    context,
                                    listen: false);
                                provider.addDoss(doss: doss, patientId: widget.patientId);
                              } catch (e) {
                                Fluttertoast.showToast(msg: e.toString());
                                setState(() {
                                  loading = false;
                                });
                              }
                              clearFields();
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Color(0xFFA2CCF9),
                            ),
                            child: Center(
                              child: Text(
                                'Enregistrer les modifications',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        EspaceVerticale(),
                      ],
                    ),
                  );
                }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  AjoutComplication(patientId: widget.patientId,))),
      ),
          );
  }

  void clearFields() {
    insulinotherapieDepuis.clear();
    allergie.clear();
    vaccin.clear();
    modeDeVie.clear();
    medicaux.clear();
    chirurgicaux.clear();
    familliaux.clear();
  }

 /* void insertComplication() async{
    StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('DossierMedical').where('idPatient', isEqualTo:widget.patientId )
          .snapshots(),
      builder: (context, snapshot) {
        DocumentSnapshot docu = snapshot.data! as DocumentSnapshot<Object?>;
        var db = FirebaseFirestore.instance.collection('DossierMedical');
        db
            .doc()
            .collection('Complication')
            .doc()
            .set({
          "idComplication": widget.patientId,
          'designation': docu['designation'],
          'posologie' : docu['posologie'],
          'datedeCreation': DateTime.now(),
          'datedeFin' : (DateTime.now().add(Duration(days: docu['nbreJours']))),
        });
        return Container();
      },
    );

  }*/
}
