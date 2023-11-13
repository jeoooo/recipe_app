import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/controllers/recipe_controller.dart';

import 'package:recipe_app/utils/pocketbase_conn.dart';

void main() {
  group('RecipeController Tests', () {
    late RecipeController recipeController;

    setUp(() {
      recipeController =
          RecipeController(pb: PocketBaseUtils.pocketBaseInstance);
    });

    // test('Create Recipe', () async {
    //   final recipe = Recipe(
    //     recipeName: 'Test Recipe',
    //     recipeServings: '4',
    //     recipePreparationTime: '30 minutes',
    //     ingredients: 'Ingredient 1, Ingredient 2, Ingredient 3',
    //     procedure: 'Step 1: Do this, Step 2: Do that',
    //   );

    //   final file = File('tests/img/picture.jpg').path;

    //   try {
    //     await recipeController.createRecipe(recipe: recipe, file: file);

    //     final records = await recipeController.getAllRecipes();
    //     expect(records.length, greaterThan(0));
    //   } catch (e) {
    //     // Print an error message to the console if an exception occurs
    //     debugPrint('Error creating recipe: $e');

    //     // Rethrow the exception to mark the test as failed
    //     rethrow;
    //   }
    // });

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

    //   try {
    //     await recipeController.updateRecipe(
    //         recordId: recordId, recipe: updatedRecipe);

    //     final records = await recipeController.getAllRecipes();
    //     final updatedRecord = records.firstWhere(
    //         (record) => record['_id'] == recordId,
    //         orElse: () => null);

    //     expect(updatedRecord, isNotNull);
    //     expect(updatedRecord['recipeName'], equals(updatedRecipe.recipeName));
    //     expect(updatedRecord['recipeServings'],
    //         equals(updatedRecipe.recipeServings));
    //     expect(updatedRecord['recipePreparationTime'],
    //         equals(updatedRecipe.recipePreparationTime));
    //     expect(updatedRecord['ingredients'], equals(updatedRecipe.ingredients));
    //     expect(updatedRecord['procedure'], equals(updatedRecipe.procedure));
    //     expect(updatedRecord['image'], equals(updatedRecipe.image));
    //   } catch (e) {
    //     // Print an error message to the console if an exception occurs
    //     debugPrint('Error updating recipe: $e');

    //     // Rethrow the exception to mark the test as failed
    //     rethrow;
    //   }
    // });

    // test('Delete Recipe', () async {
    //   // Replace 'RECORD_ID' with the actual record ID to delete
    //   final recordId = 'RECORD_ID';

    //   try {
    //     await recipeController.deleteRecipe(recordId);

    //     final records = await recipeController.getAllRecipes();
    //     final deletedRecord = records.firstWhere(
    //         (record) => record['_id'] == recordId,
    //         orElse: () => null);

    //     expect(deletedRecord, isNull);
    //   } catch (e) {
    //     // Print an error message to the console if an exception occurs
    //     debugPrint('Error deleting recipe: $e');

    //     // Rethrow the exception to mark the test as failed
    //     rethrow;
    //   }
    // });

    // test('Get All Recipes', () async {
    //   try {
    //     final records = await recipeController.getAllRecipes();
    //     print(records);
    //   } catch (e) {
    //     // Print an error message to the console if an exception occurs
    //     debugPrint('Error fetching all recipes: $e');

    //     // Rethrow the exception to mark the test as failed
    //     rethrow;
    //   }
    // });

    test('Get All Owned Recipes', () async {
      final userId = 'qy34g2yu1nopyql'; // Replace with actual user ID

      try {
        final records = await recipeController.getAllOwnedRecipes(userId);
        print(records);
      } catch (e) {
        // Print an error message to the console if an exception occurs
        debugPrint('Error fetching all owned recipes: $e');

        // Rethrow the exception to mark the test as failed
        rethrow;
      }
    });
  });
}
