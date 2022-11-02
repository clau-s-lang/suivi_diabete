import 'package:cloud_firestore/cloud_firestore.dart';

class Traitement{
  String idTraitement;
  String idPatient;
  String idMedecin;
  final String designation;
  final String posologie;
  final String datedeDebut;
  final String datedeFin;
  //final String delai;

  Traitement({
    this.idTraitement = '',
    this.idPatient ='',
    this.idMedecin ='',
    required this.designation,
    required this.posologie,
    required this.datedeDebut,
    required this.datedeFin,
    //required this.delai,
  });

  Map<String, dynamic> toJson() => {
    'idOrdonnance' : idTraitement,
    'idPatient': idPatient,
    'idMedecin': idMedecin,
    'designation': designation,
    'posologie' : posologie,
    'datedeCreation': datedeDebut,
    'datedeFin' : datedeFin,
    //'delai' : delai,
  };

 /* static Ordonnance fromJson(Map<String, dynamic> json) => Ordonnance(
    idPatient: json['idPatient'],
    idMedecin: json['idMedecin'],
    designation: json['designation'],
    posologie : json['posologie'],
    datedeDebut: json['datedeCreation'],
  );*/
}