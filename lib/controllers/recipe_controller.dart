import 'package:firebase_database/firebase_database.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeController {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('recipes');

  Future<void> addRecipe(Recipe recipe) async {
    try {
      // Generate a unique ID for the new recipe
      String recipeId = _databaseReference.push().key ?? '';

      // Set the recipe data in the database
      await _databaseReference.child(recipeId).set(recipe.toJson());
    } catch (e) {
      print('Error adding recipe: $e');
    }
  }

  Future<Stream<DatabaseEvent>?> getRecipe(String recipeId) async {
    try {
      // Fetch the recipe data from the database based on recipe ID
      DatabaseReference ref = FirebaseDatabase.instance.ref("recipes");
      Stream<DatabaseEvent> stream = ref.onValue;
      return stream;
    } catch (e) {
      print('Error fetching recipe: $e');
      return null;
    }
  }

  Future<void> updateRecipe(String recipeId, Recipe updatedRecipe) async {
    try {
      // Update the recipe data in the database
      await _databaseReference.child(recipeId).update(updatedRecipe.toJson());
    } catch (e) {
      print('Error updating recipe: $e');
    }
  }

  Future<void> deleteRecipe(String recipeId) async {
    try {
      // Delete the recipe from the database
      await _databaseReference.child(recipeId).remove();
    } catch (e) {
      print('Error deleting recipe: $e');
    }
  }
}
