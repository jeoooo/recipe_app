// ignore_for_file: prefer_const_declarations
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/controllers/user_controller.dart';
import 'package:recipe_app/utils/pocketbase_conn_test_utils.dart';

void main() {
  group('UserController Tests', () {
    late UserController userController;

    setUp(() {
      userController =
          UserController(pb: PocketBaseTestUtils.pocketBaseTestInstance);
    });

    test('Sign Up/Create User', () async {
      final username = 'testuser';
      final email = 'testuser@example.com';
      final password = 'password';
      final passwordConfirm = 'password';
      final name = 'Test User';
      final role = 'user';

      try {
        await userController.createUser(
          username: username,
          email: email,
          password: password,
          passwordConfirm: passwordConfirm,
          name: name,
          role: role,
        );
      } catch (e) {
        // Print an error message to the console if an exception occurs
        debugPrint('Error signing up user: $e');

        // Rethrow the exception to mark the test as failed
        rethrow;
      }
    });
  });
}
