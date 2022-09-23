class Users {
  String userId;
  final String email;
  final String role;

  Users({
    this.userId = '',
    required this.email,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'email': email,
        'role': role,
      };

  static Users fromJson(Map<String, dynamic> json) => Users(
        userId: json['userId'],
        email: json['email'],
        role: json['role'],
      );
}
