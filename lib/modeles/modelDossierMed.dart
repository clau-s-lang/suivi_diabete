import 'dart:ffi';

class DossierMedical {
  final String idDossier;
  final String insulinotherapie;
  final String insulinotherapieDepuis;
  final String allergie;
  final String vaccination;
  final String modeDeVie;
  final String surpoids;
  final String hypertension;
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
    required this.alcool,
    required this.allergie,
    required this.antecedentChirurgicaux,
    required this.antecedentFamilliaux,
    required this.antecedentMedicaux,
    required this.cardiovasculare,
    required this.cholesterol,
    required this.heredite,
    required this.hypertension,
    required this.idDossier,
    required this.insulinotherapie,
    required this.insulinotherapieDepuis,
    required this.maladieCoeliaque,
    required this.modeDeVie,
    required this.sendentarite,
    required this.surpoids,
    required this.tabagisme,
    required this.vaccination,
  });

  Map<String, dynamic> toJson() => {
    'alcool': alcool,
    'allergie': allergie,
    'antecedentChirurgicaux': antecedentChirurgicaux,
    'antecedentFamilliaux' : antecedentFamilliaux,
    'antecedentMedicaux' : antecedentMedicaux,
    'cardiovasculare' : cardiovasculare,
    'cholesterol' : cholesterol,
    'heredite' : heredite,
    'hypertension' : hypertension,
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
    insulinotherapieDepuis : json['insulinotherapieDepuis'],
    maladieCoeliaque: json['maladieCoeliaque'],
    modeDeVie: json['modeDeVie'],
    sendentarite: json['sendentarite'],
    surpoids: json['surpoids'],
    tabagisme: json['tabagisme'],
    vaccination: json['vaccination'],
  );
}
