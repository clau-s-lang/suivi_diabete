import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestion_diabete/database/dbUser.dart';
import 'package:gestion_diabete/modeles/modelMedecin.dart';

import '../modeles/modelPatient.dart';

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

  void signInWithEmailMed(
          {required String email,
          required String password,
          }) =>
      FireBaseApi().signInWithEmailMed(email: email, password: password);

  void addPatient({required Patient patient}) => FireBaseApi().addPatient(
        patient: patient,
      );

  void signInWithEmailPat(
          {required String email,
          required String password,
          }) =>
      FireBaseApi().signInWithEmailPat(email: email, password: password);
}
