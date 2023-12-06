// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, library_private_types_in_public_api, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/views/admin/admin_dashboard.dart';
import 'package:recipe_app/widgets/button_widget.dart';
import 'package:recipe_app/widgets/cooky_app_bar.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';
import 'package:recipe_app/auth/auth.dart';

class UpdateRecipe extends StatefulWidget {
  final String name;
  final int id;

  const UpdateRecipe({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  _UpdateRecipeState createState() => _UpdateRecipeState();
}

class _UpdateRecipeState extends State<UpdateRecipe> {
  TextEditingController recipeNameController = TextEditingController();
  TextEditingController servingsController = TextEditingController();
  TextEditingController preparationTimeController = TextEditingController();
  TextEditingController cookTimeController = TextEditingController();
  TextEditingController ingredientController = TextEditingController();
  TextEditingController procedureController = TextEditingController();

  File? selectedFile;

  RecipeController recipeController = RecipeController();

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _saveImageFile(String fileName) async {
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    final imageDirectory = Directory('${appDocumentsDirectory.path}/images');
    final imagePath = "${imageDirectory.path}/$fileName";

    await imageDirectory.create(recursive: true);
    await selectedFile!.copy(imagePath);
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
              CustomForm(
                textfieldName: 'Cook Time',
                controller: cookTimeController,
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
                onPressed: () async {
                  User? currentUser = Auth.currentUser;

                  if (currentUser != null) {
                    String? filename = selectedFile?.path.split('/').last;

                    if (filename != null) {
                      await _saveImageFile(filename);
                    }

                    Recipe updatedRecipe = Recipe(
                      id: widget.id,
                      name: recipeNameController.text,
                      servings: servingsController.text,
                      preparationTime: preparationTimeController.text,
                      cookTime: cookTimeController.text,
                      ingredients: ingredientController.text,
                      procedure: procedureController.text,
                      imageFileName: filename,
                      createdBy: currentUser.userId ?? '',
                    );

                    await recipeController.updateRecipe(updatedRecipe);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminDashboard(
                          userId: currentUser.userId ?? '',
                        ),
                      ),
                    );
                  } else {
                    print('User not logged in.');
                  }
                },
                buttonText: 'Update Recipe',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
