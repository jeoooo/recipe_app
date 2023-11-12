// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:recipe_app/views/client/dashboard.dart';
import 'package:recipe_app/views/client/login.dart';
import 'package:recipe_app/widgets/button_widget.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pb = PocketBase('http://127.0.0.1:8090');
    String name = '';
    String email_address = '';
    String username = '';
    String password = '';
    String confirm_password = '';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
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
                    width: 100, // Set your desired width
                    height: 100, // Set your desired height
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
                  hintText: name,
                  formType: FormType.Normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              width: 325,
              child: CustomForm(
                  textfieldName: 'Email Address',
                  hintText: email_address,
                  formType: FormType.Normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              width: 325,
              child: CustomForm(
                  textfieldName: 'Password',
                  hintText: password,
                  formType: FormType.Password),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              width: 325,
              child: CustomForm(
                  textfieldName: 'Confirm Password',
                  hintText: confirm_password,
                  formType: FormType.Password),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
                width: 325,
                child: Text('Passwords do not match',
                    style: GoogleFonts.lexend())),
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
                )),
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
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 325,
                  child: Button(
                    buttonText: 'Sign up',
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                  ))
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
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Color(0xffCB4036)),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.only(left: 0, right: 0)),
                        ),
                        child: Text('Log in instead!',
                            style: GoogleFonts.lexend(
                                decoration: TextDecoration.underline))),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
