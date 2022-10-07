import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestion_diabete/database/dbUser.dart';
import 'package:gestion_diabete/modeles/modelDossierMed.dart';
import 'package:gestion_diabete/modeles/modelMedecin.dart';
import 'package:gestion_diabete/modeles/modelOrdonnance.dart';

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

  void signInWithEmail(
          {required String email,
          required String password,
          }) =>
      FireBaseApi().signInWithEmail(email: email, password: password);

  void addPatient({required Patient patient}) => FireBaseApi().addPatient(
        patient: patient,
      );
  void addOrdo({required Ordonnance ord})=>FireBaseApi().addOrdo(ord:ord);

  void addDoss({required DossierMedical doss})=>FireBaseApi().addDoss(doss:doss);

  void addSigne({required SigneVitaux signe})=>FireBaseApi().addSigne(signe: signe);

 /* void signInWithEmailPat(
          {required String email,
          required String password,
          }) =>
      FireBaseApi().signInWithEmailPat(email: email, password: password);*/
}
