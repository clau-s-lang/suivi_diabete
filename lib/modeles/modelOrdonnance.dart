import 'package:cloud_firestore/cloud_firestore.dart';

class Ordonnance{
  String idOrdonnance;
  String idPatient;
  String idMedecin;
  final String designation;
  final String posologie;
  final String datedeCreation;

  Ordonnance({
    this.idOrdonnance = '',
    this.idPatient ='',
    this.idMedecin ='',
    required this.designation,
    required this.posologie,
    required this.datedeCreation
});

  Map<String, dynamic> toJson() => {
    'idPatient': idPatient,
    'idMedecin': idMedecin,
    'designation': designation,
    'posologie' : posologie,
    'datedeCreation': datedeCreation,
  };

  static Ordonnance fromJson(Map<String, dynamic> json) => Ordonnance(
    idPatient: json['idPatient'],
    idMedecin: json['idMedecin'],
    designation: json['designation'],
      posologie : json['posologie'],
      datedeCreation: json['datedeCreation'],
  );
}