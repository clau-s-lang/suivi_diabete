import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/tiles/traitement_tile.dart';

class TraitementPatient extends StatefulWidget {
  final String idOrd;

  const TraitementPatient({Key? key, required this.idOrd}) : super(key: key);
  @override
  _TraitementPatientState createState() => _TraitementPatientState();
}

class _TraitementPatientState extends State<TraitementPatient> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details du traitement'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Ordonnance').where('status', isEqualTo: 'en cours').where('idPatient', isEqualTo: user!.uid)
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

            print(widget.idOrd);
            if (!snapshot.hasData) {
              return Material(
                child: Center(
                  child: Text('Pas de données'),
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                return traitementTile(
                  designation: doc['designation'],
                  posologie: doc['posologie'],
                  datedeFin: doc['datedeFin'],
                );
              },

            );
          }),
    );
  }
}
