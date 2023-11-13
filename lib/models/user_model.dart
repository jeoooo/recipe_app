class UserModel {
  String? username;
  String? email;
  bool? emailVisibility;
  String password;
  String passwordConfirm;
  String name;
  String role;

  UserModel({
    this.username,
    this.email,
    this.emailVisibility,
    required this.password,
    required this.passwordConfirm,
    required this.name,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
