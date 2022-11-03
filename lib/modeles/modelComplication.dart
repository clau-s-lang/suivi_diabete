class Complication{
  String idComplication;
  final String designation;
  final String dateDecouverte;

  Complication({
    this.idComplication = '',
    required this.designation,
    required this.dateDecouverte,
});

  Map<String, dynamic> toJson() => {
    'designation' : designation,
    'dateDecouverte': dateDecouverte,
  };
}