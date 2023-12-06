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
  final RecipeController _recipeController = RecipeController();

  TextEditingController _formController = TextEditingController();

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
    List<String> formValues = _formController.text.split('\n');

    Recipe updatedRecipe = Recipe(
      id: widget.id,
      name: formValues[0],
      ingredients: formValues[4],
      preparationTime: formValues[2],
      procedure: formValues[5],
      imageFileName: selectedFile?.path ?? 'No file selected',
      createdBy: widget.name,
      servings: formValues[1],
      cookTime: formValues[2],
    );

    await _recipeController.updateRecipe(updatedRecipe);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AdminDashboard(
          userId: widget.name,
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
                textfieldName:
                    'Recipe Name\nNumber of Servings\nPreparation Time\nIngredients\nProcedure',
                controller: _formController,
                formType: FormType.MultiLineText,
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
