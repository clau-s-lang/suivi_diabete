import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../menus/pageMenuMedecin.dart';
import '../signes_vitaux/pageDataPatient.dart';
import '../users/pageInscriptionPatient.dart';
import '../users/pagePatientDescription.dart';

import '../modeles/modelUser.dart';
import '../widget/patient_tile.dart';

class DashboardMedecin extends StatefulWidget {
  @override
  _DashboardMedecinState createState() => _DashboardMedecinState();
}

class _DashboardMedecinState extends State<DashboardMedecin> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: MenuMedecin(),
      appBar: AppBar(
        title: Text('Mes Patients'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Patient')
            .where('medecinId', isEqualTo: user!.uid)
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
                DocumentSnapshot patientAssigned = snapshot.data!.docs[index];
                return patientTile(
                  sname: patientAssigned['sname'],
                  name: patientAssigned['fname'],
                  email: patientAssigned['email'],
                  routing: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientDescription(
                        patientId: patientAssigned['docId'],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add_alt),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  InscriptionPatient())),
      ),
    );
  }
}
