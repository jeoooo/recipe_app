import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:recipe_app/utils/pocketbase_conn.dart';

class UserController {
  final PocketBase pb;

  UserController() : pb = PocketBaseUtils.pocketBaseInstance;

  Future<void> signUpUser({
    required String username,
    required String email,
    required bool emailVisibility,
    required String password,
    required String passwordConfirm,
    required String name,
    required String role,
  }) async {
    try {
      if (password == passwordConfirm) {
        final body = <String, dynamic>{
          "username": username,
          "email": email,
          "emailVisibility": emailVisibility,
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

  // You can add more methods for user-related operations, such as login, update profile, etc.
}
