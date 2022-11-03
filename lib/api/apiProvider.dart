import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestion_diabete/database/dbUser.dart';
import 'package:gestion_diabete/modeles/modelComplication.dart';
import 'package:gestion_diabete/modeles/modelDossierMed.dart';
import 'package:gestion_diabete/modeles/modelMedecin.dart';
import 'package:gestion_diabete/modeles/modelOrdonnance.dart';

import '../modeles/modelChatting.dart';
import '../modeles/modelPatient.dart';
import '../modeles/modelSigneVitaux.dart';

class ProviderApi extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future logOut() async {
    await auth.signOut();
  }

  void signUpWithEmail(
          {required String email,
          required String password,
          required Medecin medecin}) =>
      FireBaseApi().signUpWithEmailMed(
          email: email, password: password, medecin: medecin);

 /* void signUpWithEmailPat(
      {required String email,
        required String password,
        required Patient patient,
      }) =>
      FireBaseApi().signUpWithEmailPat(
          email: email, password: password, patient: patient,);*/

  void signInWithEmail(
          {required String email,
          required String password,
          }) =>
      FireBaseApi().signInWithEmail(email: email, password: password);

  void addPatient({required Patient patient}) => FireBaseApi().addPatient(
        patient: patient,
      );
  void addOrdo({required Ordonnance ord})=>FireBaseApi().addOrdo(ord:ord);

  void addDoss({required DossierMedical doss, required String patientId})=>FireBaseApi().addDoss(doss:doss, patientId: patientId);

  void addSigne({required SigneVitaux signe})=>FireBaseApi().addSigne(signe: signe);

  void addCompl({required Complication comp, required patientId}) => FireBaseApi().addComplication(comp: comp,patientId: patientId);

  Future addProfil({
    String imgUrl = '',
  }) async {
    try {
      final docIdP = FirebaseFirestore.instance
          .collection('Patient')
          .doc(auth.currentUser!.uid);
      String docId = docIdP.id;
      await FirebaseFirestore.instance.collection('Patient').doc(docId).set({
        'imgProfil': imgUrl,
      },SetOptions(merge: true)).whenComplete(() {
      });
    } catch (e) {
      print(e);
    }
  }

  Future addProfilMed({
    String imgUrl = '',
  }) async {
    try {
      final docIdP = FirebaseFirestore.instance
          .collection('Medecin')
          .doc(auth.currentUser!.uid);
      String docId = docIdP.id;
      await FirebaseFirestore.instance.collection('Medecin').doc(docId).set({
        'imgUrl': imgUrl,
      },SetOptions(merge: true)).whenComplete(() {

      });
    } catch (e) {
      print(e);
    }
  }

  Future<String> createMessage( Message message, String patientId) async{
    final docMessage = FirebaseFirestore.instance
        .collection('Message').
        doc(patientId == auth.currentUser!.uid ? auth.currentUser!.uid : patientId).collection('chats').doc();
    //topicId = docMessage.id;
    //comment.uid = FirebaseAuth.instance.currentUser!.uid;
    await docMessage.set(message.toJson());
    return docMessage.id;
  }
}
