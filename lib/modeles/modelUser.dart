class Users {
  String UserId;
  final String Email;
  final String role;

  Users({
    this.UserId = '',
    required this.Email,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        'UserId': UserId,
        'Email': Email,
        'role': role,
      };

  static Users fromJson(Map<String, dynamic> json) => Users(
        UserId: json['UserId'],
        Email: json['Email'],
        role: json['role'],
      );
}
