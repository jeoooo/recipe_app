// Import necessary packages
// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/auth/auth.dart';

import 'package:recipe_app/views/client/login.dart';
import 'package:recipe_app/widgets/button_widget.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';

class AdminSignUp extends StatelessWidget {
  const AdminSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Auth authService = Auth(); // Replace with your SQLite service
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Row(
                children: [
                  Text(
                    'Sign up to',
                    style: GoogleFonts.paytoneOne(
                        fontSize: 20 * 1.618, color: Color(0xffCB4036)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: SvgPicture.asset('assets/sign_up_logo.svg'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                width: 325,
                child: CustomForm(
                  textfieldName: 'Full Name',
                  formType: FormType.Normal,
                  controller: nameController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                width: 325,
                child: CustomForm(
                  textfieldName: 'Email Address',
                  formType: FormType.Normal,
                  controller: emailController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                width: 325,
                child: CustomForm(
                  textfieldName: 'Password',
                  formType: FormType.Password,
                  controller: passwordController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                width: 325,
                child: CustomForm(
                  textfieldName: 'Confirm Password',
                  formType: FormType.Password,
                  controller: confirmPasswordController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 325,
                child: Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text('I agree to the Terms and Conditions',
                        style: GoogleFonts.lexend()),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                width: 325,
                child: Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text('I agree to the Privacy Policy',
                        style: GoogleFonts.lexend()),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 325,
                  child: Button(
                    buttonText: 'Sign up',
                    onPressed: () async {
                      try {
                        await Auth.signup(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                          'admin', // Assuming a default role of 'client'
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      } catch (e) {
                        // Display an AlertDialog for any exceptions
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('An error occurred: $e'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 325,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ',
                          style: GoogleFonts.lexend()),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Color(0xffCB4036)),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.only(left: 0, right: 0)),
                        ),
                        child: Text(
                          'Log in instead!',
                          style: GoogleFonts.lexend(
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
