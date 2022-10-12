import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/signes_vitaux/pageDataPatient.dart';

import '../menus/pageMenuPatient.dart';
import '../modeles/modelPatient.dart';
import '../description/pageDescriptionSignePatient.dart';
import '../signes_vitaux/pageDataMedecin.dart';
import '../tiles/signe_tile.dart';

class SignesDashMed extends StatefulWidget {
  final String patientId;

  const SignesDashMed({Key? key, required this.patientId}) : super(key: key);
  @override
  _SignesDashMedState createState() => _SignesDashMedState();
}

class _SignesDashMedState extends State<SignesDashMed> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Signes vitaux du patient'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('SigneVitaux')
            .where('patientId', isEqualTo: widget.patientId)
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
          print(widget.patientId);
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot Signes = snapshot.data!.docs[index];
                return signeTile(
                  glycemie: Signes['glycemie'],
                  routing: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonneesDuPatient(
                        idSigne: Signes['idSigne'],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  DonneesPatient())),
      ),
    );
  }
}
