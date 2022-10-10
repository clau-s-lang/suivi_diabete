import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/signes_vitaux/pageDataPatient.dart';

import '../menus/pageMenuPatient.dart';
import '../modeles/modelPatient.dart';
import '../description/pageDescriptionSignePatient.dart';
import '../tiles/signe_tile.dart';

class SignesDash extends StatefulWidget {
  @override
  _SignesDashState createState() => _SignesDashState();
}

class _SignesDashState extends State<SignesDash> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Mes signes vitaux'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('SigneVitaux')
            .where('patientId', isEqualTo: 'mlW2SHWMDUNGzcDpTUhaK8Cu2nm1')
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
          print(user!.uid);
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot messignes = snapshot.data!.docs[index];
                return signeTile(
                  glycemie: messignes['glycemie'],
                  routing: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SigneVisioPat(
                        idSigne: messignes['idSigne'],
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
