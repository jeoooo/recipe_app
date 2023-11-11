// ignore_for_file: prefer_const_constructors, prefer_final_fields, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/utils/formatTime.dart';
import 'package:recipe_app/widgets/cooky_app_bar.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';
import 'package:recipe_app/widgets/text_editor.dart';

class AdminUpdateRecipe extends StatefulWidget {
  const AdminUpdateRecipe({Key? key});

  @override
  _AdminUpdateRecipeState createState() => _AdminUpdateRecipeState();
}

class _AdminUpdateRecipeState extends State<AdminUpdateRecipe> {
  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  GlobalKey<FlutterSummernoteState> _keyEditor2 = GlobalKey();
  TimeOfDay? pickedTime;

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
                hintText: '',
                formType: FormType.Normal,
              ),
              SizedBox(
                height: 10,
              ),
              CustomForm(
                textfieldName: 'Number of Servings',
                hintText: '',
                formType: FormType.NumberInput,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Preparation Time: ',
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      color: Color(0xffCB4036),
                    ),
                  ),
                  SizedBox(width: 16), // Add space between text and button
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffCB4036)),
                    ),
                    onPressed: () async {
                      final TimeOfDay? newPickedTime = await showTimePicker(
                        context: context,
                        initialTime: pickedTime ?? TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.inputOnly,
                        builder: (BuildContext context, Widget? child) {
                          return MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              alwaysUse24HourFormat: false,
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (newPickedTime != null) {
                        setState(() {
                          pickedTime = newPickedTime;
                        });
                        debugPrint('Selected Time: ${formatTime(pickedTime!)}');
                      }
                    },
                    child: Text(
                      'Pick Time',
                      style: GoogleFonts.lexend(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  if (pickedTime != null) Text(formatTime(pickedTime!))
                ],
              ),
              Text(
                'Ingredients',
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w400,
                  color: Color(0xffCB4036),
                ),
              ),
              TextEditor(keyEditor: _keyEditor),
              Text(
                'Procedure',
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w400,
                  color: Color(0xffCB4036),
                ),
              ),
              TextEditor(keyEditor: _keyEditor2),
              Column(
                children: [
                  Row(
                    children: [
                      FilledButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Cancel Edit',
                            style: GoogleFonts.lexend(color: Color(0xff757575)),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      FilledButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xffCB4036)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Save Changes',
                            style: GoogleFonts.lexend(),
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}