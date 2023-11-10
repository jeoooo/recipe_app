import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String buttonText;
  const Button({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ButtonStyle(
            backgroundColor:
                // ignore: prefer_const_constructors
                MaterialStateProperty.all(Color(0xffCB4036))),
        onPressed: () {
          // ignore: prefer_const_constructors
        },
        child: SizedBox(
          width: 325,
          child: Center(
            child: Text(buttonText,
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
          ),
        ));
  }
}
