// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:recipe_app/views/client/dashboard.dart';
// ignore: unused_import
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
