import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class UserController {
  final pb = PocketBase('http://127.0.0.1:8090');

  Future<void> createUser({
    required String username,
    required String email,
    required bool emailVisibility,
    required String password,
    required String passwordConfirm,
    required String name,
    required String role,
  }) async {
    try {
      final body = <String, dynamic>{
        'username': username,
        'email': email,
        'emailVisibility': emailVisibility,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'name': name,
        'role': role,
      };

      await pb.collection('users').create(body: body);

      // You can handle the 'record' or perform additional actions if needed
    } catch (e) {
      // Handle errors appropriately, e.g., show an error message to the user
      debugPrint('Error creating user: $e');
    }
  }

  Future<void> updateUser({
    required dynamic recordId,
    String? username,
    bool? emailVisibility,
    String? password,
    String? passwordConfirm,
    String? oldPassword,
    String? name,
    String? role,
  }) async {
    try {
      final body = <String, dynamic>{
        'recordId': recordId,
        if (username != null) 'username': username,
        if (emailVisibility != null) 'emailVisibility': emailVisibility,
        if (password != null) 'password': password,
        if (passwordConfirm != null) 'passwordConfirm': passwordConfirm,
        if (oldPassword != null) 'oldPassword': oldPassword,
        if (name != null) 'name': name,
        if (role != null) 'role': role,
      };

      await pb.collection('users').update(recordId, body: body);

      // You can handle the 'record' or perform additional actions if needed
    } catch (e) {
      // Handle errors appropriately, e.g., show an error message to the user
      debugPrint('Error updating user: $e');
    }
  }

  Future<void> deleteUser(dynamic recordId) async {
    try {
      await pb.collection('users').delete(recordId);

      // You can perform additional actions after successful deletion if needed
    } catch (e) {
      // Handle errors appropriately, e.g., show an error message to the user
      debugPrint('Error deleting user: $e');
    }
  }
}

// void main() async {
  // final userController = UserController();

  // Test createUser
  // await userController.createUser(
  //   username: 'test_username2',
  //   email: 'test@examples.com',
  //   emailVisibility: true,
  //   password: 'admin123',
  //   passwordConfirm: 'admin123',
  //   name: 'test',
  //   role: 'client',
  // );

  // Test updateUser
  // await userController.updateUser(
  //   recordId: 'equzuvuqk8gexj0',
  //   username: 'updated_usernames',
  //   emailVisibility: false,
  //   // password: 'new_password',
  //   // passwordConfirm: 'new_password',
  //   // oldPassword: 'old_password',
  //   name: 'updated_name',
  //   role: 'updated_role',
  // );

  // Test deleteUser
  // await userController.deleteUser('equzuvuqk8gexj0');
// }
