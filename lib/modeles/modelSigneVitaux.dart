class SigneVitaux{
  final String idSigne;
  final String Glycemie;
  final String Insulinebasale;
  final String InsulineBolus;
  final String InsulineDeCorrection;
  final Map ActivitePhysique;
  final String Duree;
  final int nbreDePas;
  final Map Contexte;
  final double Poids;
  final double HbA1c;
  final double PressionArterielleSyst;
  final String PressionArterielleDiast;
  final String Remarque;

  SigneVitaux({
    required this.idSigne,
    required this.Glycemie,
    required this.Insulinebasale,
    required this.InsulineBolus,
    required this.InsulineDeCorrection,
    required this.ActivitePhysique,
    required this.Duree,
    required this.nbreDePas,
    required this.Contexte,
    required this.Poids,
    required this.HbA1c,
    required this.PressionArterielleSyst,
    required this.PressionArterielleDiast,
    required this.Remarque,
  });

  Map<String, dynamic> toJson() => {
    'idSigne': idSigne,
    'Glycemie': Glycemie,
    'Insulinebasale': Insulinebasale,
    'InsulineBolus' : InsulineBolus,
    'InsulineDeCorrection': InsulineDeCorrection,
    'ActivitePhysique' : ActivitePhysique,
    'Duree' : Duree,
    'nbreDePas' : nbreDePas,
    'Contexte' : Contexte,
    'Poids' : Poids,
    'HbA1c' : HbA1c,
    'PressionArterielleSyst' : PressionArterielleSyst,
    'PressionArterielleDiast' : PressionArterielleDiast,
    'Remarque' : Remarque,
  };

  static SigneVitaux fromJson(Map<String, dynamic> json) => SigneVitaux(
    idSigne: json['idSigne'],
    Glycemie: json['Glycemie'],
    Insulinebasale: json['Insulinebasale'],
    InsulineBolus : json['InsulineBolus'],
    InsulineDeCorrection: json['InsulineDeCorrection'],
    ActivitePhysique: json['ActivitePhysique'],
    Duree: json['Duree'],
    nbreDePas: json['nbreDePas'],
    Contexte : json['Contexte'],
    Poids: json['Poids'],
    HbA1c: json['HbA1c'],
    PressionArterielleSyst: json['PressionArterielleSyst'],
    PressionArterielleDiast: json['PressionArterielleDiast'],
    Remarque : json['Remarque'],
  );
}