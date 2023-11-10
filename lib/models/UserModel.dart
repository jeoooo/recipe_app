// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? name;
  String? emailAddress;
  String? password;
  int? userId;

  UserModel({
    this.name,
    this.emailAddress,
    this.password,
    this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        emailAddress: json["email_address"],
        password: json["password"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email_address": emailAddress,
        "password": password,
        "user_id": userId,
      };
}
