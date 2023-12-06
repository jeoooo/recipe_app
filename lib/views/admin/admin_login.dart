// Import necessary packages and files
// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/views/admin/admin_sign_up.dart';
import 'package:recipe_app/views/client/dashboard.dart';
import 'package:recipe_app/views/client/login.dart';
import 'package:recipe_app/widgets/button_widget.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';
import 'package:recipe_app/auth/auth.dart';

class AdminLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: SvgPicture.asset('assets/login_app_logo.svg'),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
                child: CustomForm(
                  textfieldName: 'Email Address',
                  formType: FormType.Normal,
                  controller: emailController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: CustomForm(
                  textfieldName: 'Password',
                  formType: FormType.Password,
                  controller: passwordController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: Button(
                  buttonText: 'Log In',
                  onPressed: () async {
                    try {
                      await Auth.login(
                        emailController.text,
                        passwordController.text,
                      );

                      if (Auth.isAuthenticated()) {
                        String userId = Auth.getUserName();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(
                              userId: userId,
                            ),
                          ),
                        );
                      } else {
                        // Handle authentication failure
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Authentication Error'),
                              content: Text(
                                  'Invalid email or password. Please try again.'),
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
                    } catch (e) {
                      // Handle other errors
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'An unexpected error occurred. Please try again.'),
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
              Padding(
                padding:
                    const EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not yet registered? ', style: GoogleFonts.lexend()),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminSignUp(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Color(0xffCB4036)),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.only(left: 0, right: 0),
                        ),
                      ),
                      child: Text(
                        'SIGN UP NOW!',
                        style: GoogleFonts.lexend(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Color(0xffCB4036)),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.only(left: 0, right: 0),
                  ),
                ),
                child: Text(
                  'Login as client',
                  style: GoogleFonts.paytoneOne(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
