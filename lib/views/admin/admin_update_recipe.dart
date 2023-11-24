// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

import 'package:recipe_app/utils/pocketbase_conn.dart';
import 'package:recipe_app/views/admin/admin_dashboard.dart';

import 'package:recipe_app/widgets/button_widget.dart';
import 'package:recipe_app/widgets/cooky_app_bar.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';
import 'package:http/http.dart' as http;

class AdminUpdateRecipe extends StatefulWidget {
  final name;
  final token;
  // ignore: use_key_in_widget_constructors
  const AdminUpdateRecipe({
    Key? key,
    required this.name,
    required this.token,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AdminUpdateRecipeState createState() => _AdminUpdateRecipeState();
}

class _AdminUpdateRecipeState extends State<AdminUpdateRecipe> {
  // Declare controllers as instance variables
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

  @override
  Widget build(BuildContext context) {
    final pb = PocketBaseUtils.pocketBaseInstance;

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
              SizedBox(
                height: 10,
              ),
              CustomForm(
                textfieldName: 'Number of Servings',
                controller: servingsController,
                formType: FormType.NumberInput,
              ),
              SizedBox(
                height: 10,
              ),
              CustomForm(
                textfieldName: 'Preparation Time',
                controller: preparationTimeController,
                formType: FormType.Normal,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffCB4036)),
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
              SizedBox(
                height: 10,
              ),
              CustomForm(
                textfieldName: 'Ingredients',
                controller: ingredientController,
                formType: FormType.MultiLineText,
              ),
              SizedBox(
                height: 10,
              ),
              CustomForm(
                textfieldName: 'Procedure',
                controller: procedureController,
                formType: FormType.MultiLineText,
              ),
              Button(
                onPressed: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminDashboard(
                        name: widget.name,
                      ),
                    ),
                  );
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
