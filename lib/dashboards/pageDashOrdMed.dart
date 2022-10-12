import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/tiles/ordonnance_tile.dart';

import '../description/pageDescriptionOrdMed.dart';
import '../ordonnances/pageOrdonnancePatient.dart';

class DashOrdonnanceMed extends StatefulWidget {
  final String patientId;

  const DashOrdonnanceMed({Key? key, required this.patientId}) : super(key: key);

  @override
  _DashOrdonnanceMedState createState() => _DashOrdonnanceMedState();
}

class _DashOrdonnanceMedState extends State<DashOrdonnanceMed> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Ordonnances'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Ordonnance')
            .where('idPatient', isEqualTo: widget.patientId).where('idMedecin', isEqualTo:user!.uid )
            .snapshots(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Material(
              child: Center(
                child: Text('Veuillez vous connecter à internet'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Material(
              child: Center(
                child: Text('Aucun patient ne vous est assigné'),
              ),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot mesordonnances = snapshot.data!.docs[index];
                return ordonnanceTile(
                  designation: mesordonnances['designation'],
                  posologie: mesordonnances['posologie'],
                  routing: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewOrdonnanceMed(
                        ordonnanceId: mesordonnances['idOrdonnance'],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      /*floatingActionButton: FloatingActionButton(
    child: const Icon(Icons.person_add_alt),
    onPressed: () => Navigator.push(context,
    MaterialPageRoute(builder: (context) =>  Profile())),
    ),*/
    );
  }
}
