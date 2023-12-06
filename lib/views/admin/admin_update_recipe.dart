// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/views/admin/admin_dashboard.dart';
import 'package:recipe_app/widgets/button_widget.dart';
import 'package:recipe_app/widgets/cooky_app_bar.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';

class AdminUpdateRecipe extends StatefulWidget {
  final String name;
  final int id; // Add id parameter

  const AdminUpdateRecipe({
    Key? key,
    required this.name,
    required this.id, // Include id in the constructor
  }) : super(key: key);

  @override
  _AdminUpdateRecipeState createState() => _AdminUpdateRecipeState();
}

class _AdminUpdateRecipeState extends State<AdminUpdateRecipe> {
  final RecipeController _recipeController = RecipeController();

  TextEditingController recipeNameController = TextEditingController();
  TextEditingController servingsController = TextEditingController();
  TextEditingController preparationTimeController = TextEditingController();
  TextEditingController ingredientController = TextEditingController();
  TextEditingController procedureController = TextEditingController();

  File? selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _updateRecipe() async {
    String recipeName = recipeNameController.text;
    String servings = servingsController.text;
    String preparationTime = preparationTimeController.text;
    String ingredients = ingredientController.text;
    String procedure = procedureController.text;

    Recipe updatedRecipe = Recipe(
      id: widget.id, // Use the provided id
      name: recipeName,
      ingredients: ingredients.split('\n'),
      procedure: procedure,
      image: selectedFile?.path ?? 'No file selected',
      createdBy: widget.name,
      servings: servings.toString(),
      cookTime: preparationTime,
    );

    await _recipeController.updateRecipe(updatedRecipe);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AdminDashboard(
          name: widget.name,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CookyAppBar(color: Color(0xffCB4036)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomForm(
                textfieldName: 'Recipe Name',
                controller: recipeNameController,
                formType: FormType.Normal,
              ),
              SizedBox(height: 10),
              CustomForm(
                textfieldName: 'Number of Servings',
                controller: servingsController,
                formType: FormType.NumberInput,
              ),
              SizedBox(height: 10),
              CustomForm(
                textfieldName: 'Preparation Time',
                controller: preparationTimeController,
                formType: FormType.Normal,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffCB4036)),
                    ),
                    onPressed: _pickFile,
                    child: Text(
                      'Upload Recipe Image',
                      style: GoogleFonts.lexend(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      selectedFile?.path ?? 'No file selected',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomForm(
                textfieldName: 'Ingredients',
                controller: ingredientController,
                formType: FormType.MultiLineText,
              ),
              SizedBox(height: 10),
              CustomForm(
                textfieldName: 'Procedure',
                controller: procedureController,
                formType: FormType.MultiLineText,
              ),
              Button(
                onPressed: _updateRecipe,
                buttonText: 'Update Recipe',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
