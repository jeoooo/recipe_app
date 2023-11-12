import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/utils/pocketbase_conn_test_utils.dart';

void main() {
  group('RecipeController Tests', () {
    late RecipeController recipeController;

    setUp(() {
      recipeController =
          RecipeController(pb: PocketBaseTestUtils.pocketBaseTestInstance);
    });

    test('Create Recipe', () async {
      final recipe = Recipe(
        recipeName: 'Test Recipe',
        recipeServings: '4',
        recipePreparationTime: '30 minutes',
        ingredients: 'Ingredient 1, Ingredient 2, Ingredient 3',
        procedure: 'Step 1: Do this, Step 2: Do that',
      );

      try {
        await recipeController.createRecipe(
            recipe: recipe, file: 'tests/img/sisig.jpg');

        // Add assertions based on your expected behavior after creating a recipe
        // For example, you can check if the recipe is present in the list after creation.

        // Print a success message to the console
        // debugPrint('Recipe created successfully!');
      } catch (e) {
        // Print an error message to the console if an exception occurs
        debugPrint('Error creating recipe: $e');

        // Rethrow the exception to mark the test as failed
        rethrow;
      }
    });

    // test('Update Recipe', () async {
    //   // Replace 'RECORD_ID' with the actual record ID to update
    //   final recordId = 'RECORD_ID';

    //   final updatedRecipe = Recipe(
    //     recipeName: 'Updated Recipe',
    //     recipeServings: '6',
    //     recipePreparationTime: '45 minutes',
    //     ingredients: 'Updated Ingredient 1, Updated Ingredient 2',
    //     procedure: 'Updated Step 1: Do this, Updated Step 2: Do that',
    //     image: 'updated_filename.jpg',
    //   );

    //   await recipeController.updateRecipe(
    //       recordId: recordId, recipe: updatedRecipe);

    //   // Add assertions based on your expected behavior after updating a recipe
    //   // For example, you can check if the recipe has been updated successfully.
    // });

    // test('Delete Recipe', () async {
    //   // Replace 'RECORD_ID' with the actual record ID to delete
    //   final recordId = 'RECORD_ID';

    //   await recipeController.deleteRecipe(recordId);

    //   // Add assertions based on your expected behavior after deleting a recipe
    //   // For example, you can check if the recipe is no longer present in the list.
    // });

    test('Get All Recipes', () async {
      final recipes = await recipeController.getAllRecipes();

      // Print the recipes to the console
      for (var recipe in recipes) {
        debugPrint(
            'Recipe Name: ${recipe.recipeName}, Servings: ${recipe.recipeServings}');
      }

      // Add assertions based on your expected behavior after fetching all recipes
      // For example, you can check if the returned list is not empty.
      expect(recipes.isNotEmpty, true);
    });
  });
}
