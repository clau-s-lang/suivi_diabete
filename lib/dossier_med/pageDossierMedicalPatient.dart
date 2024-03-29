import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../menus/pageMenuPatient.dart';

class DossierMedPatient extends StatefulWidget {
  final String idDoss;

  const DossierMedPatient({Key? key, required this.idDoss}) : super(key: key);
  @override
  _DossierMedPatientState createState() => _DossierMedPatientState();
}

class _DossierMedPatientState extends State<DossierMedPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Detail du dossier medical'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('DossierMedical')
              .doc(widget.idDoss)
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

            print(widget.idDoss);
            if (!snapshot.hasData) {
              return Material(
                child: Center(
                  child: Text('Pas de données'),
                ),
              );
            }
            DocumentSnapshot doc = snapshot.data!;

            return ListView(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFE8F0FE),
                        backgroundImage: AssetImage('images/doss.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, bottom: 5),
                      child: Text(
                        'Général',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ), //Titres dossier Med
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Insulinotherapie')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['insulinotherapie']), //doc['insulinotherapie']
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Insulinotherapie depuis')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['insulinotherapieDepuis']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Allergie')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['allergie']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Vaccination')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['vaccination']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Mode de vie')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['modeDeVie']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Surpoids, obésité')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['surpoids']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Hypertension')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['hypertension']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Hypothyroide')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['hypotroide']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Maladie coeliaque')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['maladieCoeliaque']),
                    ),
                  ],
                ),
                //general
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFE8F0FE),
                        backgroundImage: AssetImage('images/doss.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, bottom: 5),
                      child: Text(
                        'Antécédents',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Médicaux')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['antecedentMedicaux']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Chirurgicaux')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['antecedentChirurgicaux']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Familliaux')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['antecedentFamilliaux']),
                    ),
                  ],
                ),
                //antecedents
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFE8F0FE),
                        backgroundImage: AssetImage('images/doss.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, bottom: 5),
                      child: Text(
                        'Facteurs risques',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Tabagisme')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['tabagisme']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Alcool')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['alcool']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Sendantarité')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['sendentarite']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Cholesterol')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['cholesterol']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Héredité')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['heredite']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text('Cardio-vasculaire')),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xFFE8F0FE),
                      child: Text(doc['cardiovasculare']),
                    ),
                  ],
                ),
                SizedBox(height: 10,),

              ],
            );
          }),
    );
  }
}
