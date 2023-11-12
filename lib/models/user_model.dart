// ignore_for_file: non_constant_identifier_names

class User {
  int? user_id;
  String? username;
  String? email;
  bool? emailVisibility;
  String? password;
  String? passwordConfirm;
  String? name;
  String? role;

  User({
    this.user_id,
    this.username,
    this.email,
    this.emailVisibility,
    this.password,
    this.passwordConfirm,
    this.name,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_id: json['id'],
      username: json['username'],
      email: json['email'],
      emailVisibility: json['emailVisibility'],
      password: json['password'],
      passwordConfirm: json['passwordConfirm'],
      name: json['name'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': user_id,
      'username': username,
      'email': email,
      'emailVisibility': emailVisibility,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'name': name,
      'role': role,
    };
  }
}
