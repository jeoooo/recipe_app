import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/utils/pocketbase_conn.dart';

class RecipeController {
  final pb = PocketBaseUtils.pocketBaseInstance;

  Future<void> createRecipe({
    String? userId,
    String? recipeName,
    String? recipeServings,
    String? recipePreparationTime,
    String? ingredients,
    String? procedure,
    File? image,
  }) async {
    try {
      final body = Recipe(
        userId: userId ?? '',
        recipeName: recipeName ?? '',
        recipeServings: recipeServings ?? '',
        recipePreparationTime: recipePreparationTime ?? '',
        ingredients: ingredients ?? '',
        procedure: procedure ?? '',
        image: image,
      ).toJson();

      await pb.collection('recipe').create(body: body);
    } catch (e) {
      debugPrint('Error creating recipe: $e');
    }
  }

  Future<void> updateRecipe({
    required String recordId,
    String? userId,
    String? recipeName,
    String? recipeServings,
    String? recipePreparationTime,
    String? ingredients,
    String? procedure,
    File? image,
  }) async {
    try {
      final body = Recipe(
        userId: userId ?? '',
        recipeName: recipeName ?? '',
        recipeServings: recipeServings ?? '',
        recipePreparationTime: recipePreparationTime ?? '',
        ingredients: ingredients ?? '',
        procedure: procedure ?? '',
        image: image,
      ).toJson();

      await pb.collection('recipe').update(recordId, body: body);
      await pb.collection('recipe').getFullList();
    } catch (e) {
      debugPrint('Error updating recipe: $e');
    }
  }

  Future<List<Recipe>> getAllRecipes() async {
    try {
      final result = await pb.collection('recipe').getFullList();
      // Assuming PocketBase returns a list of Map<String, dynamic>
      return result
          .map((json) => Recipe.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('Error getting all recipes: $e');
      return [];
    }
  }

  Future<void> deleteRecipe(String recordId) async {
    try {
      await pb.collection('recipe').delete(recordId);
    } catch (e) {
      debugPrint('Error deleting recipe: $e');
    }
  }
}
