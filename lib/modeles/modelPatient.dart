import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelUser.dart';

class Patient {
  String idPatient;
  final String fname;
  final String sname;
  final String genre;
  final String userId;
  final String adresse;
  final String email;
  final String medecinId;
  final String numPhone;
  final String admittedDate;
  final String password;

  Patient({
    this.idPatient = '',
    required this.medecinId,
    required this.fname,
    required this.sname,
    required this.email,
    required this.genre,
    required this.adresse,
    required this.admittedDate,
    required this.numPhone,
    this.userId = '',
    required this.password,
    //this.autresComplications,
    /* required this.idDossierMedicales,
    required this.idMedecinAssigned,*/
    //required this.birthday,
  });
  Map<String, dynamic> toJson() => {
        'idPatient': idPatient,
        'fname': fname,
        'sname': sname,
        'email': email,
        'genre': genre,
         'adresse' : adresse,
        'medecinId': medecinId,
        'numPhone': numPhone,
        'admittedDate' : admittedDate,
      };

  Map<String, dynamic> toUserP() => {
    'UserId': userId,
    'Email': email,
    'role': 'patient',
  };

  /*static Patient fromJson(Map<String, dynamic> json) => Patient(
        idPatient: json['idPatient'],
        fname: json['fname'],
        sname: json['sname'],
        email: json['email'],
        genre: json['genre'],
        adresse: json['adresse'],
        medecinId: json['medecinId'],
        numPhone: json['numPhone'],

      );*/
}
