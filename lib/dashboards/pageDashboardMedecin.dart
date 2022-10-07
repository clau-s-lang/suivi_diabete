import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/profile_patient.dart';
import 'package:provider/provider.dart';
import '../api/apiProvider.dart';
import '../menus/pageMenuMedecin.dart';
import '../signes_vitaux/pageDataPatient.dart';
import '../users/pageInscriptionPatient.dart';
import '../users/pageLogin.dart';
import '../description/pagePatientDescription.dart';

import '../modeles/modelUser.dart';
import '../tiles/patient_tile.dart';

class DashboardMedecin extends StatefulWidget {
  @override
  _DashboardMedecinState createState() => _DashboardMedecinState();
}

class _DashboardMedecinState extends State<DashboardMedecin> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Patients'),
        backgroundColor: Color(0xFF216DAD),
        actions: [
          TextButton.icon(
              icon: Icon(Icons.logout, color: Colors.white,),
              onPressed: (){
                final provider = Provider.of<ProviderApi>(context, listen: false);
                provider.logOut();
                // Center(child: CircularProgressIndicator(),);
              },
              label: Text('Deconnexion', style:TextStyle(color: Colors.white),)),
        ],
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
                        patientId: patientAssigned['idPatient'],
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
