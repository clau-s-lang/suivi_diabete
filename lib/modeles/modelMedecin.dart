class Medecin {
  String idMedecin;
  final String fname;
  final String sname;
  final String genre;
  final String userId;
  final String email;
  final String numPhone;
  final String specialisation;
  final String clinique;
  final String password;

  //final String role;
  //final String password;

  Medecin({
    this.idMedecin = '',
    required this.specialisation,
    required this.clinique,
    required this.fname,
    required this.sname,
    required this.genre,
    this.userId = '',
    required this.email,
    required this.numPhone,
    required this.password,
    //required this.role,
    //required this.password,
  });

  Map<String, dynamic> toJson() => {
        'idUser': idMedecin,
        'fname': fname,
        'sname': sname,
        'genre': genre,
        'numPhone': numPhone,
        'email': email,
        'specialisation': specialisation,
        'clinique': clinique,
      };
  Map<String, dynamic> toUser() => {
        'UserId': userId,
        'email': email,
        'role': 'medecin',
      };

  /*static Medecin fromJson(Map<String, dynamic> json) => Medecin(
        idMedecin: json['idUser'],
        fname: json['fname'],
        sname: json['sname'],
        genre: json['genre'],
        email: json['email'],
        numPhone: json['numPhone'],
        specialisation: json['specialisation'],
        clinique: json['clinique'],

        //userId: json['userId'],

        //role: json['role'],
        //password: json['password'],
      );*/
}
