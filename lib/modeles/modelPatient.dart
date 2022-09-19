

import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelUser.dart';

class Patient {
  String idPatient;
  final String IdDossierMedicales;
  final String IdMedecinAssigned;
  final String? AutresComplications;
  final DateTime birthday;

  Patient({
    this.idPatient = '',
    required this.IdDossierMedicales,
    required this.IdMedecinAssigned,
    this.AutresComplications,
    required this.birthday,
});
  Map<String, dynamic> toJson() => {
    'idPatient' : idPatient,
    'IdDossierMedicales' : IdDossierMedicales,
    'IdMedecinAssigned' : IdMedecinAssigned,
    'AutresComplications': AutresComplications,
    'birthday' : birthday,
  };

  static Patient fromJson(Map<String, dynamic> json) => Patient(
    idPatient: json['idPatient'],
    IdDossierMedicales:json['IdDossierMedicales'],
    IdMedecinAssigned: json['IdMedecinAssigned'],
    AutresComplications: json['AutresComplications'],
      birthday: (json['birthday'] as Timestamp).toDate(),
  );
}