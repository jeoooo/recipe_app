// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:recipe_app/auth/auth.dart';
import 'package:recipe_app/db/db_conn.dart';
import 'package:recipe_app/views/client/create_recipe.dart';
import 'package:recipe_app/views/client/dashboard.dart';
import 'package:recipe_app/views/client/login.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized
  // Initialize the database and print connection logs
  await _initDatabase();

  runApp(MainApp());
}

Future<void> _initDatabase() async {
  try {
    await DatabaseHelper().database;
  } catch (e) {
    print('Error initializing the database: $e');
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
