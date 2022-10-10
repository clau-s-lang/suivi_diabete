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
  String medecinId;
  final String numPhone;
  final String admittedDate;
  final String password;
  final String birthday;
  final String typeDediabte;
  final String anneeDecouverte;
  final String modeDecouverte;

  Patient({
    this.idPatient = '',
    this.medecinId = '',
    required this.fname,
    required this.sname,
    required this.email,
    required this.genre,
    required this.adresse,
    required this.admittedDate,
    required this.numPhone,
    required this.birthday,
    required this.anneeDecouverte,
    required this.modeDecouverte,
    required this.typeDediabte,
    this.userId = '',
    required this.password,
  });
  Map<String, dynamic> toJson() => {
        'idPatient': idPatient,
        'fname': fname,
        'sname': sname,
        'email': email,
        'genre': genre,
        'age': birthday,
        'anneeDecouverte': anneeDecouverte,
        'modeDecouverte': modeDecouverte,
        'typeDediabte': typeDediabte,
        'adresse': adresse,
        'medecinId': medecinId,
        'numPhone': numPhone,
        'admittedDate': admittedDate,
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
