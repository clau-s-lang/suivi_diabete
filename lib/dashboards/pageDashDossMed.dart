import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../dossier_med/pageDossierMedicalPatient.dart';
import '../tiles/dossier_tile.dart';

class DashDossPat extends StatefulWidget {
  final String patientId;

  const DashDossPat({Key? key, required this.patientId}) : super(key: key);

  @override
  _DashDossPatState createState() => _DashDossPatState();
}

class _DashDossPatState extends State<DashDossPat> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Dossier medical'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('DossierMedical')
            .where('idPatient', isEqualTo: widget.patientId).where('idMedecin', isEqualTo:user!.uid )//'mlW2SHWMDUNGzcDpTUhaK8Cu2nm1'
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
                DocumentSnapshot mondoss = snapshot.data!.docs[index];
                return dossierTile(
                  routing: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DossierMedPatient(
                        idDoss: mondoss['idDossier'],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
