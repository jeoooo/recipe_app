// ignore_for_file: prefer_const_declarations, avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/auth/auth.dart';

void main() {
  group('Authentication Tests', () {
    test('Authenticate User', () async {
      // final baseUrl = 'http://10.0.2.2:8090'; // For emulator
      final baseUrl = 'http://127.0.0.1:8090'; // For testing on a real device

      final email = 'client@example.com';
      final password = 'client123';

      try {
        final authResult = await authenticateUser(baseUrl, email, password);

        if (authResult != null) {
          print('Authentication successful:');
          print('ID: ${authResult.id}');
          print('Name: ${authResult.name}');
          print('Role: ${authResult.role}');
          print('Email: ${authResult.email}');
          print('Token: ${authResult.token}');
          // Add more information as needed
        } else {
          print('Authentication failed');
        }
      } catch (e) {
        print('Error during authentication: $e');
      }
    });

    test('Authenticate User with Invalid Credentials', () async {
      // final baseUrl = 'http://10.0.2.2:8090'; // For emulator
      final baseUrl = 'http://127.0.0.1:8090'; // For testing on a real device

      final email = 'client@example.com';
      final password = 'invalidPassword';

      try {
        final authResult = await authenticateUser(baseUrl, email, password);

        if (authResult != null) {
          print('Authentication successful:');
          print('ID: ${authResult.id}');
          print('Name: ${authResult.name}');
          print('Role: ${authResult.role}');
          print('Email: ${authResult.email}');
          print('Token: ${authResult.token}');
          // Add more information as needed
        } else {
          print('Authentication failed');
        }
      } catch (e) {
        print('Error during authentication: $e');
      }
    });
  });
}
