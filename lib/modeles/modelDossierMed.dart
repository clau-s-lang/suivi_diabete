import 'dart:ffi';

class DossierMedical {
  final String idDossier;
  final String typeDeDiabete;
  final String anneeDecouverte;
  final String modeDeDecouverte;
  final String insulinotherapie;
  final String insulinotherapieDepuis;
  final Array allergie;
  final Array vaccination;
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
  final String age;
  final String heredite;
  final String cardiovasculare;

  DossierMedical({
    required this.age,
    required this.alcool,
    required this.allergie,
    required this.anneeDecouverte,
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
    required this.modeDeDecouverte,
    required this.modeDeVie,
    required this.sendentarite,
    required this.surpoids,
    required this.tabagisme,
    required this.typeDeDiabete,
    required this.vaccination,
  });

  Map<String, dynamic> toJson() => {
    'age': age,
    'alcool': alcool,
    'allergie': allergie,
    'anneeDecouverte' : anneeDecouverte,
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
    'modeDeDecouverte' : modeDeDecouverte,
    'modeDeVie': modeDeVie,
    'sendentarite' : sendentarite,
    'surpoids' : surpoids,
    'tabagisme' : tabagisme,
    'typeDeDiabete' : typeDeDiabete,
    'vaccination' : vaccination,
  };

  static DossierMedical fromJson(Map<String, dynamic> json) => DossierMedical(
    age: json['age'],
    alcool: json['alcool'],
    allergie: json['allergie'],
    anneeDecouverte : json['anneeDecouverte'],
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
    modeDeDecouverte : json['modeDeDecouverte'],
    modeDeVie: json['modeDeVie'],
    sendentarite: json['sendentarite'],
    surpoids: json['surpoids'],
    tabagisme: json['tabagisme'],
    typeDeDiabete : json['typeDeDiabete'],
    vaccination: json['vaccination'],
  );
}
