// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:recipe_app/views/admin/admin_login.dart';
import 'package:recipe_app/views/client/dashboard.dart';
import 'package:recipe_app/views/client/sign_up.dart';
import 'package:recipe_app/widgets/button_widget.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pb = PocketBase('http://127.0.0.1:8090');
    // ignore: non_constant_identifier_names
    String email_address = '';
    String password = '';
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
                    hintText: email_address,
                    formType: FormType.Normal),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: CustomForm(
                    textfieldName: 'Password',
                    hintText: password,
                    formType: FormType.Password),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                  child: Button(
                    buttonText: 'Log In',
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 100.0, left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not yet registered? ', style: GoogleFonts.lexend()),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Color(0xffCB4036)),
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.only(left: 0, right: 0)),
                          ),
                          child: Text('SIGN UP NOW!',
                              style: GoogleFonts.lexend(
                                  decoration: TextDecoration.underline))),
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AdminLogin()));
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll(Color(0xffCB4036)),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.only(left: 0, right: 0)),
                  ),
                  child: Text('Login as admin',
                      style: GoogleFonts.paytoneOne(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline))),
            ],
          ),
        ),
      ),
    );
  }
}
