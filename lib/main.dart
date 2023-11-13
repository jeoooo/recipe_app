// ignore_for_file: prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:recipe_app/views/client/create_recipe.dart';
import 'package:recipe_app/views/client/dashboard.dart';
import 'package:recipe_app/views/client/login.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
