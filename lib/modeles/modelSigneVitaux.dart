class SigneVitaux{
  String idSigne;
  final String patientId;
  final String glycemie;
  final String insulinebasale;
  final String insulineBolus;
  final String insulineDeCorrection;
  final String activitePhysique;
  final String duree;
  final String nbreDePas;
  final String contexte;
  final String poids;
  final String hbA1c;
  final String pressionArterielleSyst;
  final String pressionArterielleDiast;
  final String remarque;
  final String time;

  SigneVitaux({
    this.idSigne = '',
    required this.glycemie,
    required this.insulinebasale,
    required this.insulineBolus,
    required this.insulineDeCorrection,
    required this.duree,
    required this.nbreDePas,
    required this.contexte,
    required this.patientId,
    required this.activitePhysique,
    required this.poids,
    required this.hbA1c,
    required this.pressionArterielleSyst,
    required this.pressionArterielleDiast,
    required this.remarque,
    required this.time,
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
    'contexteMaladie' : contexte,
    'poids' : poids,
    'hbA1c' : hbA1c,
    'patientId': patientId,
    'pressionArterielleSyst' : pressionArterielleSyst,
    'pressionArterielleDiast' : pressionArterielleDiast,
    'remarque' : remarque,
    'time':time,
  };

 /* static SigneVitaux fromJson(Map<String, dynamic> json) => SigneVitaux(
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
  );*/
}