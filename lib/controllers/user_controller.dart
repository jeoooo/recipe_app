import 'package:flutter/material.dart';
import 'package:recipe_app/models/user_model.dart';
import 'package:recipe_app/utils/pocketbase_conn.dart';

class UserController {
  final pb = PocketBaseUtils.pocketBaseInstance;

  Future<void> createUser({
    required User user,
  }) async {
    try {
      final body = user.toJson();

      await pb.collection('users').create(body: body);

      // You can handle the 'record' or perform additional actions if needed
    } catch (e) {
      // Handle errors appropriately, e.g., show an error message to the user
      debugPrint('Error creating user: $e');
    }
  }

  Future<void> updateUser({
    required dynamic recordId,
    User? user,
  }) async {
    try {
      final body = <String, dynamic>{
        'recordId': recordId,
        if (user != null) ...user.toJson(),
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
