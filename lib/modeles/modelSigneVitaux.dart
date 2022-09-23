class SigneVitaux{
  final String idSigne;
  final String glycemie;
  final String insulinebasale;
  final String insulineBolus;
  final String insulineDeCorrection;
  final Map activitePhysique;
  final String duree;
  final int nbreDePas;
  final Map contexte;
  final double poids;
  final double hbA1c;
  final double pressionArterielleSyst;
  final String pressionArterielleDiast;
  final String remarque;

  SigneVitaux({
    required this.idSigne,
    required this.glycemie,
    required this.insulinebasale,
    required this.insulineBolus,
    required this.insulineDeCorrection,
    required this.activitePhysique,
    required this.duree,
    required this.nbreDePas,
    required this.contexte,
    required this.poids,
    required this.hbA1c,
    required this.pressionArterielleSyst,
    required this.pressionArterielleDiast,
    required this.remarque,
  });

  Map<String, dynamic> toJson() => {
    'idSigne': idSigne,
    'glycemie': glycemie,
    'insulinebasale': insulinebasale,
    'insulineBolus' : insulineBolus,
    'insulineDeCorrection': insulineDeCorrection,
    'activitePhysique' : activitePhysique,
    'duree' : duree,
    'nbreDePas' : nbreDePas,
    'contexte' : contexte,
    'poids' : poids,
    'hbA1c' : hbA1c,
    'pressionArterielleSyst' : pressionArterielleSyst,
    'pressionArterielleDiast' : pressionArterielleDiast,
    'remarque' : remarque,
  };

  static SigneVitaux fromJson(Map<String, dynamic> json) => SigneVitaux(
    idSigne: json['idSigne'],
    glycemie: json['glycemie'],
    insulinebasale: json['insulinebasale'],
    insulineBolus : json['insulineBolus'],
    insulineDeCorrection: json['insulineDeCorrection'],
    activitePhysique: json['activitePhysique'],
    duree: json['duree'],
    nbreDePas: json['nbreDePas'],
    contexte : json['contexte'],
    poids: json['poids'],
    hbA1c: json['hbA1c'],
    pressionArterielleSyst: json['pressionArterielleSyst'],
    pressionArterielleDiast: json['pressionArterielleDiast'],
    remarque : json['remarque'],
  );
}