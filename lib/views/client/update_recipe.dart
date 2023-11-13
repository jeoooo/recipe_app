// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

import 'package:recipe_app/utils/pocketbase_conn.dart';
import 'package:recipe_app/views/client/dashboard.dart';
import 'package:recipe_app/widgets/button_widget.dart';
import 'package:recipe_app/widgets/cooky_app_bar.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';
import 'package:http/http.dart' as http;

class UpdateRecipe extends StatefulWidget {
  final id;
  final name;
  final token;
  // ignore: use_key_in_widget_constructors
  const UpdateRecipe({
    Key? key,
    required this.id,
    required this.name,
    required this.token,
  });

  @override
  // ignore: library_private_types_in_public_api
  _UpdateRecipeState createState() => _UpdateRecipeState();
}

class _UpdateRecipeState extends State<UpdateRecipe> {
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
                  final body = <String, dynamic>{
                    "user_id": widget.id,
                    "recipe_name": recipeNameController.text,
                    "recipe_servings": servingsController.text,
                    "recipe_preparation_time": preparationTimeController.text,
                    "ingredients": ingredientController.text,
                    "procedure": procedureController.text
                  };

                  final multipartFile = http.MultipartFile.fromBytes(
                      'image', await File(selectedFile!.path).readAsBytes(),
                      filename: selectedFile!.path);
                  await pb
                      .collection('recipe')
                      .create(body: body, files: [multipartFile]);

                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(
                          name: widget.name,
                          token: widget.token,
                          id: widget.id),
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
