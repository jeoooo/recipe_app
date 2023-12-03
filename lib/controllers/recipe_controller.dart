import 'dart:async';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:sqflite/sqflite.dart';

class RecipeController {
  late Database _database;

  // Insert a new recipe
  Future<void> insertRecipe(Recipe recipe) async {
    await _database.insert('recipes', recipe.toMap());
  }

  // Get all recipes
  Future<List<Recipe>> getRecipes() async {
    final List<Map<String, dynamic>> maps = await _database.query('recipes');
    return List.generate(maps.length, (i) {
      return Recipe.fromMap(maps[i]);
    });
  }

  Future<Recipe?> getRecipeById(int id) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      'recipes',
      where: 'recipe_id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      // If a recipe with the specified id is found, return it
      return Recipe.fromMap(maps.first);
    }

    // If no recipe is found with the specified id, return null
    return null;
  }

  // Update a recipe
  Future<void> updateRecipe(Recipe recipe) async {
    await _database.update('recipes', recipe.toMap(),
        where: 'recipe_id = ?', whereArgs: [recipe.id]);
  }

  // Delete a recipe
  Future<void> deleteRecipe(int id) async {
    await _database.delete('recipes', where: 'recipe_id = ?', whereArgs: [id]);
  }
}
