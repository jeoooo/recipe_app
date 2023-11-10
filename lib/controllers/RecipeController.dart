// ignore_for_file: avoid_print, file_names

import 'package:recipe_app/models/RecipeModel.dart';

class RecipeController {
  List<RecipeModel> recipes = [];

  // Admin Dashboard
  void viewAdminDashboard() {
    print("Viewing admin dashboard");
  }

  // Recipe Management
  void viewAllRecipes() {
    print("Viewing all recipes");
    for (var recipe in recipes) {
      print("${recipe.recipeId}: ${recipe.recipeName}");
    }
  }

  void addRecipe(RecipeModel newRecipe) {
    print("Adding a new recipe");
    recipes.add(newRecipe);
  }

  void editRecipe(int recipeId, RecipeModel updatedRecipe) {
    // ignore: prefer_typing_uninitialized_variables
    var existingRecipe;
    // ignore: unnecessary_null_comparison
    if (existingRecipe != null) {
      existingRecipe.recipeName = updatedRecipe.recipeName;
      existingRecipe.servings = updatedRecipe.servings;
      existingRecipe.preparationTime = updatedRecipe.preparationTime;
      existingRecipe.recipeImage = updatedRecipe.recipeImage;
      existingRecipe.ingredients = updatedRecipe.ingredients;
      existingRecipe.procedure = updatedRecipe.procedure;
      print("Recipe edited successfully");
    } else {
      print("Recipe not found");
    }
  }
  
  void deleteRecipe(int recipeId) {
    recipes.removeWhere((recipe) => recipe.recipeId == recipeId);
    print("Recipe deleted successfully");
  }

  // User Dashboard
  void viewUserDashboard() {
    print("Viewing user dashboard");
    // Implement logic for basic user dashboard
  }
}
