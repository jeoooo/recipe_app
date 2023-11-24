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
  // ignore: use_key_in_widget_constructors
  const AdminLogin({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminDashboard(
                          name: "authResult?.name",
                        ),
                      ),
                    );
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
                            EdgeInsets.only(left: 0, right: 0)),
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
