import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/models/recipe_model.dart';

void main() {
  group('RecipeController', () {
    late RecipeController recipeController;

    setUp(() {
      recipeController = RecipeController();
    });

    test('createRecipe should create a new recipe', () async {
      final recipe = Recipe(
        userId: 'user1',
        recipeName: 'Test Recipe',
        recipeServings: '4',
        recipePreparationTime: '30 minutes',
        ingredients: 'Ingredient 1, Ingredient 2',
        procedure: 'Step 1, Step 2',
        image: null,
      );

      await recipeController.createRecipe(
        userId: recipe.userId,
        recipeName: recipe.recipeName,
        recipeServings: recipe.recipeServings,
        recipePreparationTime: recipe.recipePreparationTime,
        ingredients: recipe.ingredients,
        procedure: recipe.procedure,
        image: recipe.image,
      );

      final recipes = await recipeController.getAllRecipes();
      expect(recipes.length, 1);
      expect(recipes.first.recipeName, recipe.recipeName);
    });

    test('updateRecipe should update an existing recipe', () async {
      final recipe = Recipe(
        userId: 'user1',
        recipeName: 'Test Recipe',
        recipeServings: '4',
        recipePreparationTime: '30 minutes',
        ingredients: 'Ingredient 1, Ingredient 2',
        procedure: 'Step 1, Step 2',
        image: null,
      );

      await recipeController.createRecipe(
        userId: recipe.userId,
        recipeName: recipe.recipeName,
        recipeServings: recipe.recipeServings,
        recipePreparationTime: recipe.recipePreparationTime,
        ingredients: recipe.ingredients,
        procedure: recipe.procedure,
        image: recipe.image,
      );

      final updatedRecipe = Recipe(
        userId: 'user1',
        recipeName: 'Updated Recipe',
        recipeServings: '6',
        recipePreparationTime: '45 minutes',
        ingredients: 'Ingredient 1, Ingredient 2, Ingredient 3',
        procedure: 'Step 1, Step 2, Step 3',
        image: null,
      );

      final recipes = await recipeController.getAllRecipes();
      final recipeToUpdate = recipes.first;

      await recipeController.updateRecipe(
        recordId: recipeToUpdate.id!,
        userId: updatedRecipe.userId,
        recipeName: updatedRecipe.recipeName,
        recipeServings: updatedRecipe.recipeServings,
        recipePreparationTime: updatedRecipe.recipePreparationTime,
        ingredients: updatedRecipe.ingredients,
        procedure: updatedRecipe.procedure,
        image: updatedRecipe.image,
      );

      final updatedRecipes = await recipeController.getAllRecipes();
      expect(updatedRecipes.length, 1);
      expect(updatedRecipes.first.recipeName, updatedRecipe.recipeName);
    });

    test('deleteRecipe should delete an existing recipe', () async {
      final recipe = Recipe(
        userId: 'user1',
        recipeName: 'Test Recipe',
        recipeServings: '4',
        recipePreparationTime: '30 minutes',
        ingredients: 'Ingredient 1, Ingredient 2',
        procedure: 'Step 1, Step 2',
        image: null,
      );

      await recipeController.createRecipe(
        userId: recipe.userId,
        recipeName: recipe.recipeName,
        recipeServings: recipe.recipeServings,
        recipePreparationTime: recipe.recipePreparationTime,
        ingredients: recipe.ingredients,
        procedure: recipe.procedure,
        image: recipe.image,
      );

      final recipes = await recipeController.getAllRecipes();
      final recipeToDelete = recipes.first;

      await recipeController.deleteRecipe(recipeToDelete.id!);

      final updatedRecipes = await recipeController.getAllRecipes();
      expect(updatedRecipes.length, 0);
    });
  });
}
