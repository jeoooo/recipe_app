import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeController {
  final pb = PocketBase('http://127.0.0.1:8090');

  Future<void> createRecipe(Recipe recipe) async {
    try {
      final body = <String, dynamic>{
        'user_id': recipe.userId,
        'recipe_name': recipe.recipeName,
        'recipe_servings': recipe.recipeServings,
        'recipe_preparation_time': recipe.recipePreparationTime,
        'ingredients': recipe.ingredients,
        'procedure': recipe.procedure,
      };

      await pb.collection('recipe').create(body: body);
    } catch (e) {
      debugPrint('Error creating recipe: $e');
    }
  }
}
