import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Reusables/IdentifiantOrdonance.dart';
import '../subcollection_traitement.dart';

class OrdonnancePatient extends StatefulWidget {
  final String ordonnanceId;

  const OrdonnancePatient({Key? key, required this.ordonnanceId})
      : super(key: key);
  @override
  _OrdonnancePatientState createState() => _OrdonnancePatientState();
}

class _OrdonnancePatientState extends State<OrdonnancePatient> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Ordonnance')
            .doc(widget.ordonnanceId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Material(
                child:
                    Center(child: Text('Veuillez vous connecter à internet')));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Material(child: Center(child: CircularProgressIndicator()));
          }

          print(widget.ordonnanceId);
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
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Card(
                  color: Color(0xFFE8F0FE),
                  child: Column(
                    children: [
                      Container(
                        //height: 100,
                        padding: EdgeInsets.only(left: 15, top: 10),
                        // margin: EdgeInsets.only(left: 30, right: 30),
                        width: 300,
                        child: Text(
                          doc['designation'],
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        // margin: EdgeInsets.only(left: 30, right: 30),
                        width: 300,
                        child: const Text(
                          'Posologie',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        //height: 100,
                        padding: EdgeInsets.only(left: 15, bottom: 10),
                        // margin: EdgeInsets.only(left: 30, right: 30),
                        width: 300,
                        child: Text(
                          doc['posologie'],
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  insertTraitement();
                },
                child: Container(
                  padding: EdgeInsets.only(left: 240, right: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 15,
                      ),
                      Container(
                        child: Text(
                          'Confirmer',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
             /* Container(
                padding: EdgeInsets.only(left: 200),
                child: AjoutSuppression(
                  icone: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 15,
                  ),
                  designation: 'Confirmer',
                  couleur: Colors.green,
                ),
              ),*/
              SizedBox(
                height: 5,
              ),
            ],
          );
        },
      ),
    );
  }
  void insertTraitement() async{
    var db = FirebaseFirestore.instance.collection('Patient');

    db
        .doc(user!.uid)
        .collection('Traitement')
        .doc()
        .set({
      "idTraitement": widget.ordonnanceId,
    });
  }
}
