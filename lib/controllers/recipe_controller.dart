import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:recipe_app/utils/pocketbase_conn.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeController {
  PocketBase pb = PocketBaseUtils.pocketBaseInstance;

  RecipeController({required this.pb});

  Future<void> createRecipe(
      {required Recipe recipe, required String file}) async {
    try {
      final body = recipe.toJson();
      // final multipartFile =
      //     http.MultipartFile.fromString('image', file, filename: file);
      final multipartFile = http.MultipartFile.fromBytes(
        'image',
        await File(file).readAsBytes(),
        filename: file,
      );

      await pb.collection('recipe').create(body: body, files: [multipartFile]);
      // Handle the created record or perform additional actions if needed
    } catch (e) {
      // Handle errors appropriately, e.g., show an error message to the user
      debugPrint('Error creating recipe: $e');
    }
  }

  Future<void> updateRecipe({
    required String recordId,
    required Recipe recipe,
  }) async {
    try {
      final body = recipe.toJson();
      await pb.collection('recipe').update(recordId, body: body);
      // Handle the updated record or perform additional actions if needed
    } catch (e) {
      // Handle errors appropriately, e.g., show an error message to the user
      debugPrint('Error updating recipe: $e');
    }
  }

  Future<void> deleteRecipe(String recordId) async {
    try {
      await pb.collection('recipe').delete(recordId);
      // Perform additional actions after successful deletion if needed
    } catch (e) {
      // Handle errors appropriately, e.g., show an error message to the user
      debugPrint('Error deleting recipe: $e');
    }
  }

  Future<dynamic> getAllRecipes() async {
    try {
      final records = await pb.collection('recipe').getFullList();

      return records;
    } catch (e) {
      // Handle errors appropriately, e.g., show an error message to the user
      debugPrint('Error fetching all recipes: $e');
      return [];
    }
  }

  Future<dynamic> getAllOwnedRecipes(String id) async {
    try {
      final records = await pb
          .collection('recipe')
          .getFullList(fields: 'recipe_name, image', filter: 'user_id="$id"');

      return records;
    } catch (e) {
      // Handle errors appropriately, e.g., show an error message to the user
      debugPrint('Error fetching all recipes: $e');
      return [];
    }
  }
}
