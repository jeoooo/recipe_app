// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipe_app/views/admin/admin_update_recipe.dart';
import 'package:recipe_app/views/client/update_recipe.dart';

class AddRecipeFAB extends StatelessWidget {
  final String? currentScreen;

  const AddRecipeFAB({
    Key? key,
    this.currentScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        // Implement the action you want when the FAB is pressed
        if (currentScreen == 'dashboard') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => UpdateRecipe()));
        } else if (currentScreen == 'admindashboard') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AdminUpdateRecipe()));
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