// ignore_for_file: prefer_const_constructors, unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/auth/auth.dart';
import 'package:recipe_app/firebase_options.dart';
import 'package:recipe_app/views/client/create_recipe.dart';
import 'package:recipe_app/views/client/dashboard.dart';
import 'package:recipe_app/views/client/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
