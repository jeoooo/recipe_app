import 'package:sqflite/sqflite.dart';
import 'package:recipe_app/db/db_conn.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeController {
  late Database _database;
  late bool _isDatabaseInitialized;

  RecipeController() {
    _isDatabaseInitialized = false;
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final DatabaseHelper dbHelper = DatabaseHelper();
    _database = await dbHelper.database;
    _isDatabaseInitialized = true;
  }

  Future<void> _ensureDatabaseInitialized() async {
    if (!_isDatabaseInitialized) {
      await _initDatabase();
    }
  }

  Future<void> insertRecipe(Recipe recipe) async {
    await _ensureDatabaseInitialized();
    await _database.insert("recipes", recipe.toMap());
  }

  Future<List<Recipe>> getAllRecipes() async {
    await _ensureDatabaseInitialized();
    final List<Map<String, dynamic>> maps = await _database.query('recipes');
    return List.generate(maps.length, (i) {
      return Recipe.fromMap(maps[i]);
    });
  }

  Future<Recipe?> getRecipeById(int id) async {
    await _ensureDatabaseInitialized();
    final List<Map<String, dynamic>> maps = await _database.query(
      'recipes',
      where: 'recipe_id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Recipe.fromMap(maps.first);
    }

    return null;
  }

  Future<void> updateRecipe(Recipe recipe) async {
    await _ensureDatabaseInitialized();
    await _database.update('recipes', recipe.toMap(),
        where: 'recipe_id = ?', whereArgs: [recipe.id]);
  }

  Future<void> deleteRecipe(int id) async {
    await _ensureDatabaseInitialized();
    await _database.delete('recipes', where: 'recipe_id = ?', whereArgs: [id]);
  }
}
