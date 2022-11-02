import 'package:cloud_firestore/cloud_firestore.dart';

class Ordonnance{
  String idOrdonnance;
  String idPatient;
  String idMedecin;
  final String designation;
  final String posologie;
  final String nbreJours;
  final String datedeCreation;

  Ordonnance({
    this.idOrdonnance = '',
    this.idPatient ='',
    this.idMedecin ='',
    required this.nbreJours,
    required this.designation,
    required this.posologie,
    required this.datedeCreation
});

  Map<String, dynamic> toJson() => {
    'idOrdonnance' : idOrdonnance,
    'idPatient': idPatient,
    'idMedecin': idMedecin,
    'designation': designation,
    'posologie' : posologie,
    'datedeCreation': datedeCreation,
    'nbreJours' :nbreJours,
  };

  static Ordonnance fromJson(Map<String, dynamic> json) => Ordonnance(
    idPatient: json['idPatient'],
    idMedecin: json['idMedecin'],
    designation: json['designation'],
      posologie : json['posologie'],
      datedeCreation: json['datedeCreation'],
      nbreJours: json['nbreJours'],
  );
}