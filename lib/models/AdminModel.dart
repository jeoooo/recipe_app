// To parse this JSON data, do
//
//     final adminModel = adminModelFromJson(jsonString);

import 'dart:convert';

AdminModel adminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  String? name;
  String? emailAddress;
  String? password;
  int? userId;

  AdminModel({
    this.name,
    this.emailAddress,
    this.password,
    this.userId,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
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
