import 'package:cloud_firestore/cloud_firestore.dart';

class Ordonnance{
  final String idPatient;
  final String idMedecin;
  final String designation;
  final String posologie;
  final DateTime DatedeCreation;

  Ordonnance({
    required this.idPatient,
    required this.idMedecin,
    required this.designation,
    required this.posologie,
    required this.DatedeCreation
});

  Map<String, dynamic> toJson() => {
    'idPatient': idPatient,
    'idMedecin': idMedecin,
    'designation': designation,
    'posologie' : posologie,
    'DatedeCreation': DatedeCreation,
  };

  static Ordonnance fromJson(Map<String, dynamic> json) => Ordonnance(
    idPatient: json['idPatient'],
    idMedecin: json['idMedecin'],
    designation: json['designation'],
      posologie : json['posologie'],
      DatedeCreation: (json['DatedeCreation'] as Timestamp).toDate(),
  );
}