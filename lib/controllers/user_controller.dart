// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:recipe_app/utils/pocketbase_conn.dart';

class UserController {
  PocketBase pb = PocketBaseUtils.pocketBaseInstance;

  UserController({required this.pb});

  Future<void> createUser({
    String? username,
    String? email,
    required String password,
    required String passwordConfirm,
    required String name,
    required String role,
  }) async {
    try {
      if (password == passwordConfirm) {
        final body = <String, dynamic>{
          if (username != null) "username": username,
          if (email != null) "email": email,
          "password": password,
          "passwordConfirm": passwordConfirm,
          "name": name,
          "role": role,
        };

        await pb.collection('users').create(body: body);
      } else {
        // Handle password mismatch error
        throw Exception('Passwords do not match');
      }
    } catch (e) {
      // Handle exceptions here
      debugPrint("Error: $e");
      // You can add further error handling or logging here
      rethrow; // Rethrow the exception if needed
    }
  }

  Future<void> logOutUser() async {
    try {
      pb.authStore.clear();
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> updateUser({
    required id,
    String? username,
    String? email,
    bool? emailVisibility,
    String? password,
    String? passwordConfirm,
    String? name,
    String? role,
  }) async {
    try {
      final body = <String, dynamic>{};

      // Only include non-null parameters in the request body
      if (username != null) body["username"] = username;
      if (email != null) body["email"] = email;
      if (emailVisibility != null) body["emailVisibility"] = emailVisibility;
      if (password != null) body["password"] = password;
      if (passwordConfirm != null) body["passwordConfirm"] = passwordConfirm;
      if (name != null) body["name"] = name;
      if (role != null) body["role"] = role;

      if (password == null ||
          passwordConfirm == null ||
          password == passwordConfirm) {
        // Update 'RECORD_ID' with the actual record ID you want to update
        await pb.collection('users').update(id, body: body);
      } else {
        // Handle password mismatch error
        throw Exception('Passwords do not match');
      }
    } catch (e) {
      // Handle exceptions here
      debugPrint("Error: $e");
      // You can add further error handling or logging here
      rethrow; // Rethrow the exception if needed
    }
  }
}
