import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientDescription extends StatelessWidget {
  final String patientId;

  const PatientDescription({Key? key, required this.patientId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Patients'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Patient')
            .doc('$patientId')
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
          if (!snapshot.hasData) {
            return Material(
              child: Center(
                child: Text('Pas de données'),
              ),
            );
          }
          DocumentSnapshot<Object?>? doc = snapshot.data;
          /* String formettedDate =
              DateFormat('yyyy-MM-dd').format(doc['time'].toDate()).toString();*/
          return ListView(
            padding: EdgeInsets.all(20),
            children: [
              Row(
                children: [
                  Container(
                    height: 200,
                    child: CircleAvatar(
                        backgroundImage: AssetImage(doc!['photo'])),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
