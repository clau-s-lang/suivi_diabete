class Medecin {
  String idMedecin;
  final String fname;
  final String sname;
  final String genre;
  final String UserId;
  final String Email;
  //final String role;
  //final String password;
  final String numPhone;
  final String Specialisation;
  final String Clinique;

  Medecin({
    this.idMedecin = '',
    required this.Specialisation,
    required this.Clinique,
    required this.fname,
    required this.sname,
    required this.genre,
    this.UserId = '',
    required this.Email,
    //required this.role,
    //required this.password,
    required this.numPhone,
  });

  Map<String, dynamic> toJson() => {
        'idUser': idMedecin,
        'Specialisation': Specialisation,
        'Clinique': Clinique,
        'fname': fname,
        'sname': sname,
        'genre': genre,
        //'password': password,
        'numPhone': numPhone,
        'UserId': UserId,
        'Email': Email,
        'role': 'medecin',
      };
  Map<String, dynamic> toUser() => {
        'UserId': UserId,
        'Email': Email,
        'role': 'medecin',
      };

  static Medecin fromJson(Map<String, dynamic> json) => Medecin(
        idMedecin: json['idUser'],
        Specialisation: json['Specialisation'],
        Clinique: json['Clinique'],
        fname: json['fname'],
        sname: json['sname'],
        genre: json['genre'],
        UserId: json['UserId'],
        Email: json['Email'],
        //role: json['role'],
        //password: json['password'],
        numPhone: json['numPhone'],
      );
}
