class User {
  int user_id;
  String username;
  String email;
  bool emailVisibility;
  String password;
  String passwordConfirm;
  String name;
  String role;

  User({
    required this.user_id,
    required this.username,
    required this.email,
    required this.emailVisibility,
    required this.password,
    required this.passwordConfirm,
    required this.name,
    required this.role,
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
