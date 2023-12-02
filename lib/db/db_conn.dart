// database_helper.dart
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart'; // Add this line

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(appDocumentsDirectory.path, 'db_recipe_app.db');
    print('Database path: $path');

    // Delete the existing database file if it exists
    await deleteDatabase(path);

    ByteData data =
        await rootBundle.load('assets/db_recipe_app/db_recipe_app.db');
    List<int> bytes = data.buffer.asUint8List();
    await File(path).writeAsBytes(bytes);

    try {
      _database = await openDatabase(path, version: 2, onCreate: _onCreate);
      print('Connected to the database successfully');
    } catch (e) {
      print('Error connecting to the database: $e');
      rethrow;
    }

    return _database!;
  }

  Future<void> _onCreate(Database db, int version) async {
    print('Creating "users" table...');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS "users" (
        "user_id" INTEGER NOT NULL,
        "full_name" TEXT NOT NULL,
        "email_address" TEXT NOT NULL,
        "password" TEXT NOT NULL,
        "role" TEXT NOT NULL,
        PRIMARY KEY("user_id" AUTOINCREMENT)
      )
    ''');

    print('Creating "recipes" table...');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS "recipes" (
        "recipe_id" INTEGER NOT NULL,
        "recipe_name" TEXT NOT NULL,
        "ingredients" TEXT NOT NULL,
        "procedure" TEXT NOT NULL,
        "created_by" TEXT NOT NULL,
        "servings" TEXT NOT NULL,
        "cookTime" TEXT NOT NULL,
        "imageFileName" TEXT,
        FOREIGN KEY("created_by") REFERENCES "users"("user_id"),
        PRIMARY KEY("recipe_id" AUTOINCREMENT)
      )
    ''');
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
