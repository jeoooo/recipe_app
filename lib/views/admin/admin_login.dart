// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/views/admin/admin_dashboard.dart';
import 'package:recipe_app/views/admin/admin_sign_up.dart';
import 'package:recipe_app/views/client/login.dart';

import 'package:recipe_app/widgets/button_widget.dart';
import 'package:recipe_app/widgets/customForm_widget.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: SvgPicture.asset('assets/login_app_logo.svg'),
            ),
            SizedBox(height: 32),
            Text('Admin Login ',
                style: GoogleFonts.paytoneOne(
                  color: Color(0xffCB4036),
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                )),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
              child: CustomForm(
                  textfieldName: 'Email Address',
                  hintText: '',
                  formType: FormType.Normal),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
              child: CustomForm(
                  textfieldName: 'Password',
                  hintText: '',
                  formType: FormType.Password),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: Button(
                  buttonText: 'Log In',
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminDashboard()));
                  },
                )),
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
                                  builder: (context) => AdminSignUp()));
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
                      MaterialPageRoute(builder: (context) => Login()));
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Color(0xffCB4036)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.only(left: 0, right: 0)),
                ),
                child: Text('Login as user',
                    style: GoogleFonts.paytoneOne(
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline))),
          ],
        ),
      ),
    );
  }
}
