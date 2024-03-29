//import 'package:cloesloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_diabete/modeles/modelOrdonnance.dart';
import 'package:gestion_diabete/modeles/modelDossierMed.dart';
import '../modeles/modelChatting.dart';
import '../modeles/modelComplication.dart';
import '../modeles/modelMedecin.dart';
import '../modeles/modelPatient.dart';
import '../modeles/modelSigneVitaux.dart';

class FireBaseApi extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signUpWithEmailMed(
      {required String email,
      required String password,
      required Medecin medecin}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      print(user?.uid);
      toFirestore(userCredential.user, medecin);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'Le mot de passe fourni est faible.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: 'Il existe déjà une compte avec ce mail.',
          toastLength: Toast.LENGTH_LONG,
        );
      } else if (e.code == 'too-many-requests') {
        Fluttertoast.showToast(
            msg:
                'Nous avons bloqué toutes les requetes en provenance de votre appareil suite à une activté inhabituelle ');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  /* Future signUpWithEmailPat(
      {required String email,
        required String password,
        required Patient patient,
      }) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      print(user?.uid);
      ajoutPatient(userCredential.user, patient,);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'Le mot de passe fourni est faible.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: 'Il existe déjà une compte avec ce mail.',
          toastLength: Toast.LENGTH_LONG,
        );
      } else if (e.code == 'too-many-requests') {
        Fluttertoast.showToast(
            msg:
            'Nous avons bloqué toutes les requetes en provenance de votre appareil suite à une activté inhabituelle ');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }*/
  Future toFirestore(User? user, Medecin medecin) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: medecin.email,
        password: medecin.password,
      );
      medecin.idMedecin = user!.uid;
      await _firestore
          .collection('Medecin')
          .doc(user.uid)
          .set(medecin.toJson());
      await _firestore
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set(medecin.toUser());
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  /*Future ajoutPatient(User? user, Patient patient,) async {
    final medecinId = auth.currentUser!.uid;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: patient.email,
        password: patient.password,
      );
      patient.idPatient = user!.uid;
      await _firestore
          .collection('Patient')
          .doc(user.uid)
          .set(patient.toJson());
      await _firestore
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set(patient.toUserP());
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }*/
  Future addComplication({required Complication comp, required String patientId}) async{
    try{
      final CompId = FirebaseFirestore.instance.collection('DossierMedical').doc(patientId).collection('Complication').doc();
      String docId = CompId.id;
      await FirebaseFirestore.instance.collection('DossierMedical').doc(patientId).collection('Complication').doc(docId).set(comp.toJson());
    }catch(e){
      print(e);
    }
  }

  Future addPatient({required Patient patient}) async {
    final medecinId = auth.currentUser!.uid;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: patient.email,
        password: patient.password,
      );
      await _firestore.collection('Users').doc(userCredential.user!.uid).set({
        'userId': userCredential.user!.uid,
        'email': patient.email,
        'role': 'patient'
      });
      final newPatient =
          _firestore.collection('Patient').doc(userCredential.user!.uid);
      await newPatient.set({
        'idPatient': userCredential.user!.uid,
        'fname': patient.fname,
        'sname': patient.sname,
        'medecinId': medecinId,
        'email': patient.email,
        'genre': patient.genre,
        'numPhone': patient.numPhone,
        'anneeDecouverte': patient.anneeDecouverte,
        'modeDecouverte': patient.modeDecouverte,
        'typeDediabete': patient.typeDediabte,
        'adresse': patient.adresse,
        'admittedDate': patient.admittedDate
      }).catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  Future signInWithEmail(
      {required String email, required String password, context}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'Email ou mot de passe incorrect.',
            backgroundColor: Colors.redAccent);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Email ou mot de passe incorrect.');
      } else if (e.code == 'too-many-requests') {
        Fluttertoast.showToast(
            msg:
                'Nous avons bloqué toutes les requetes en provenance de votre appareil suite à une activté inhabituelle');
      }
    }
  }

  Future newPatient(Patient patient) async {
    final docUser = _firestore.collection('Patient').doc();
    try {
      patient.idPatient = docUser.id;
      final json = patient.toJson();
      await docUser.set(json);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future medecinPatient(String? patientId, String? medecinId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Patient')
          .doc(patientId!)
          .update({"IdMedecinAssigned": medecinId!});
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

/*
  Future toFirestoreP(User? user, Patient patient) async {
    try {
      patient.idPatient = user!.uid;
      await _firestore
          .collection('Patient')
          .doc(user.uid)
          .set(patient.toJson());
      await _firestore.collection('Users').doc(user.uid).set(patient.toUserP());
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }*/

  Future addOrdo({required Ordonnance ord}) async {
    try {
      final docIdO = FirebaseFirestore.instance.collection('Ordonnance').doc();
      String docId = docIdO.id;
      ord.idOrdonnance = docId;
      await FirebaseFirestore.instance.collection('Ordonnance').doc(docId).set(
            ord.toJson(),
          );
    } catch (e) {
      print(e);
    }
  }

  Future addDoss({required DossierMedical doss, required String patientId}) async {
    try {
      final docIdDoss =
          FirebaseFirestore.instance.collection('DossierMedical').doc(patientId);
      String docId = docIdDoss.id;
      doss.idDossier = docId;
      await FirebaseFirestore.instance
          .collection('DossierMedical')
          .doc(docId)
          .set(
            doss.toJson(),
          );
    } catch (e) {
      print(e);
    }
  }

  Future addSigne({required SigneVitaux signe}) async {
    try {
      final docIdDoss =
          FirebaseFirestore.instance.collection('SigneVitaux').doc();
      String docId = docIdDoss.id;
      signe.idSigne = docId;
      await FirebaseFirestore.instance.collection('SigneVitaux').doc(docId).set(
            signe.toJson(),
          );
    } catch (e) {
      print(e);
    }
  }


}
