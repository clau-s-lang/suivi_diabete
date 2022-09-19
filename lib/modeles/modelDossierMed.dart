import 'dart:ffi';

class DossierMedical {
  final String idDossier;
  final String TypeDeDiabete;
  final String AnneeDecouverte;
  final String modeDeDecouverte;
  final String insulinotherapie;
  final String insulinotherapieDepuis;
  final Array Allergie;
  final Array Vaccination;
  final String modeDeVie;
  final String Surpoids;
  final String hypertension;
  final String maladieCoeliaque;
  final String AntecedentMedicaux;
  final String AntecedentChirurgicaux;
  final String AntecedentFamilliaux;
  final String Tabagisme;
  final String alcool;
  final String sendentarite;
  final String cholesterol;
  final String age;
  final String Heredite;
  final String Cardiovasculare;

  DossierMedical({
    required this.age,
    required this.alcool,
    required this.Allergie,
    required this.AnneeDecouverte,
    required this.AntecedentChirurgicaux,
    required this.AntecedentFamilliaux,
    required this.AntecedentMedicaux,
    required this.Cardiovasculare,
    required this.cholesterol,
    required this.Heredite,
    required this.hypertension,
    required this.idDossier,
    required this.insulinotherapie,
    required this.insulinotherapieDepuis,
    required this.maladieCoeliaque,
    required this.modeDeDecouverte,
    required this.modeDeVie,
    required this.sendentarite,
    required this.Surpoids,
    required this.Tabagisme,
    required this.TypeDeDiabete,
    required this.Vaccination,
  });

  Map<String, dynamic> toJson() => {
    'age': age,
    'alcool': alcool,
    'Allergie': Allergie,
    'AnneeDecouverte' : AnneeDecouverte,
    'AntecedentChirurgicaux': AntecedentChirurgicaux,
    'AntecedentFamilliaux' : AntecedentFamilliaux,
    'AntecedentMedicaux' : AntecedentMedicaux,
    'Cardiovasculare' : Cardiovasculare,
    'cholesterol' : cholesterol,
    'Heredite' : Heredite,
    'hypertension' : hypertension,
    'idDossier' : idDossier,
    'insulinotherapie' : insulinotherapie,
    'insulinotherapieDepuis' : insulinotherapieDepuis,
    'maladieCoeliaque' : maladieCoeliaque,
    'modeDeDecouverte' : modeDeDecouverte,
    'modeDeVie': modeDeVie,
    'sendentarite' : sendentarite,
    'Surpoids' : Surpoids,
    'Tabagisme' : Tabagisme,
    'TypeDeDiabete' : TypeDeDiabete,
    'Vaccination' : Vaccination,
  };

  static DossierMedical fromJson(Map<String, dynamic> json) => DossierMedical(
    age: json['age'],
    alcool: json['alcool'],
    Allergie: json['Allergie'],
    AnneeDecouverte : json['AnneeDecouverte'],
    AntecedentChirurgicaux: json['AntecedentChirurgicaux'],
    AntecedentFamilliaux: json['AntecedentFamilliaux'],
    AntecedentMedicaux: json['AntecedentMedicaux'],
    Cardiovasculare: json['Cardiovasculare'],
    cholesterol : json['cholesterol'],
    Heredite: json['Heredite'],
    hypertension: json['hypertension'],
    idDossier: json['idDossier'],
    insulinotherapie: json['insulinotherapie'],
    insulinotherapieDepuis : json['insulinotherapieDepuis'],
    maladieCoeliaque: json['maladieCoeliaque'],
    modeDeDecouverte : json['modeDeDecouverte'],
    modeDeVie: json['modeDeVie'],
    sendentarite: json['sendentarite'],
    Surpoids: json['Surpoids'],
    Tabagisme: json['Tabagisme'],
    TypeDeDiabete : json['TypeDeDiabete'],
    Vaccination: json['Vaccination'],
  );
}
