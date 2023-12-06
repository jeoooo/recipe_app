// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:recipe_app/views/admin/admin_create_recipe.dart';
import 'package:recipe_app/views/client/create_recipe.dart';

class AddRecipeFAB extends StatelessWidget {
  final String? currentScreen;

  const AddRecipeFAB({Key? key, this.currentScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        if (currentScreen == 'dashboard') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CreateRecipe()));
        } else if (currentScreen == 'admindashboard') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AdminCreateRecipe()));
        } else {
          // Handle other cases or do nothing if currentScreen is not provided
          debugPrint('Extended FAB pressed');
        }
      },
      label: Text('Add Recipe'),
      icon: Icon(Icons.add),
      backgroundColor: Color(0xffCB4036),
    );
  }
}
