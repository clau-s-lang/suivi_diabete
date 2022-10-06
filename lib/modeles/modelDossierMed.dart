import 'dart:ffi';

class DossierMedical {
  String idDossier;
  String idPatient;
  String idMedecin;
  final String insulinotherapie;
  String insulinotherapieDepuis;
  String allergie;
  final String vaccination;
  final String modeDeVie;
  final String surpoids;
  final String hypertension;
  final String hypotroide;
  final String maladieCoeliaque;
  final String antecedentMedicaux;
  final String antecedentChirurgicaux;
  final String antecedentFamilliaux;
  final String tabagisme;
  final String alcool;
  final String sendentarite;
  final String cholesterol;
  final String heredite;
  final String cardiovasculare;

  DossierMedical({
    this.idDossier = '',
    this.idPatient = '',
    this.idMedecin = '',
    required this.alcool,
    this.allergie = 'null',
    required this.antecedentChirurgicaux,
    required this.antecedentFamilliaux,
    required this.antecedentMedicaux,
    required this.cardiovasculare,
    required this.cholesterol,
    required this.heredite,
    required this.hypertension,
    required this.hypotroide,
    required this.insulinotherapie,
    this.insulinotherapieDepuis = 'null',
    required this.maladieCoeliaque,
    required this.modeDeVie,
    required this.sendentarite,
    required this.surpoids,
    required this.tabagisme,
    required this.vaccination,
  });

  Map<String, dynamic> toJson() => {
    'idDossier':idDossier,
    'idPatient' : idPatient,
    'idMedecin':idMedecin,
    'alcool': alcool,
    'allergie': allergie,
    'antecedentChirurgicaux': antecedentChirurgicaux,
    'antecedentFamilliaux' : antecedentFamilliaux,
    'antecedentMedicaux' : antecedentMedicaux,
    'cardiovasculare' : cardiovasculare,
    'cholesterol' : cholesterol,
    'heredite' : heredite,
    'hypertension' : hypertension,
    'hypotroide':hypotroide,
    'idDossier' : idDossier,
    'insulinotherapie' : insulinotherapie,
    'insulinotherapieDepuis' : insulinotherapieDepuis,
    'maladieCoeliaque' : maladieCoeliaque,
    'modeDeVie': modeDeVie,
    'sendentarite' : sendentarite,
    'surpoids' : surpoids,
    'tabagisme' : tabagisme,
    'vaccination' : vaccination,
  };

  static DossierMedical fromJson(Map<String, dynamic> json) => DossierMedical(
    alcool: json['alcool'],
    allergie: json['allergie'],
    antecedentChirurgicaux: json['antecedentChirurgicaux'],
    antecedentFamilliaux: json['antecedentFamilliaux'],
    antecedentMedicaux: json['antecedentMedicaux'],
    cardiovasculare: json['cardiovasculare'],
    cholesterol : json['cholesterol'],
    heredite: json['heredite'],
    hypertension: json['hypertension'],
    idDossier: json['idDossier'],
    insulinotherapie: json['insulinotherapie'],
    hypotroide:json['hypotroide'],
    insulinotherapieDepuis : json['insulinotherapieDepuis'],
    maladieCoeliaque: json['maladieCoeliaque'],
    modeDeVie: json['modeDeVie'],
    sendentarite: json['sendentarite'],
    surpoids: json['surpoids'],
    tabagisme: json['tabagisme'],
    vaccination: json['vaccination'],
  );
}
