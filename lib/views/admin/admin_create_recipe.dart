// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/views/client/dashboard.dart';
import 'package:recipe_app/widgets/button_widget.dart';
import 'package:recipe_app/widgets/cooky_app_bar.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';
import 'package:recipe_app/auth/auth.dart';

class AdminCreateRecipe extends StatefulWidget {
  final name;

  const AdminCreateRecipe({Key? key, required this.name});

  @override
  _AdminCreateRecipeState createState() => _AdminCreateRecipeState();
}

class _AdminCreateRecipeState extends State<AdminCreateRecipe> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CookyAppBar(color: const Color(0xffCB4036)),
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
              const SizedBox(
                height: 10,
              ),
              CustomForm(
                textfieldName: 'Number of Servings',
                controller: servingsController,
                formType: FormType.NumberInput,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomForm(
                textfieldName: 'Preparation Time',
                controller: preparationTimeController,
                formType: FormType.Normal,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomForm(
                textfieldName: 'Cook Time',
                controller: cookTimeController,
                formType: FormType.Normal,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(const Color(0xffCB4036)),
                    ),
                    onPressed: _pickFile,
                    child: Text(
                      'Upload Recipe Image',
                      style: GoogleFonts.lexend(fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      selectedFile?.path ?? 'No file selected',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomForm(
                textfieldName: 'Ingredients',
                controller: ingredientController,
                formType: FormType.MultiLineText,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomForm(
                textfieldName: 'Procedure',
                controller: procedureController,
                formType: FormType.MultiLineText,
              ),
              Button(
                onPressed: () async {
                  User? currentUser = Auth.currentUser;

                  if (currentUser != null) {
                    // Get the filename from the path
                    String? filename = selectedFile?.path.split('/').last;

                    Recipe newRecipe = Recipe(
                      name: recipeNameController.text,
                      servings: servingsController.text,
                      preparationTime: preparationTimeController.text,
                      cookTime: cookTimeController.text,
                      ingredients: ingredientController.text,
                      procedure: procedureController.text,
                      image: filename,
                      createdBy: currentUser.userId ?? '',
                    );

                    // Save the image to the app's local storage
                    if (selectedFile != null) {
                      final imageDirectory = Directory("YOUR_IMAGE_DIRECTORY");
                      final imagePath = "${imageDirectory.path}/$filename";

                      await selectedFile!.copy(imagePath);
                    }

                    await recipeController.insertRecipe(newRecipe);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(
                          userId: currentUser.userId ?? '',
                        ),
                      ),
                    );
                  } else {
                    print('User not logged in.');
                  }
                },
                buttonText: 'Publish Recipe',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
