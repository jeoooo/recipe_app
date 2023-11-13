import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthResult {
  final String id;
  final String name;
  final String role;
  final String email;
  final String token;

  AuthResult(
      {required this.id,
      required this.name,
      required this.role,
      required this.email,
      required this.token});

  factory AuthResult.fromJson(Map<String, dynamic> json) {
    final record = json['record'];
    return AuthResult(
      id: record['id'],
      name: record['name'],
      role: record['role'],
      email: record['email'],
      token: json['token'],
    );
  }
}

Future<AuthResult?> authenticateUser(
    String baseUrl, String email, String password) async {
  try {
    final url = Uri.parse('$baseUrl/api/collections/users/auth-with-password');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'identity': email, 'password': password});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final authData = jsonDecode(response.body);
      return AuthResult.fromJson(authData);
    } else {
      print('Authentication failed. Status code: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

// Example usage:
void main() async {
  final baseUrl = 'http://10.0.2.2:8090'; // For emulator
  // final baseUrl = 'http://127.0.0.1:8090'; // For testing on a real device

  final email = 'client@example.com';
  final password = 'client123';

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
}
