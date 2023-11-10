// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FormType {
  Normal,
  Password,
}

class CustomForm extends StatefulWidget {
  final String textfieldName;
  final String hintText;
  final FormType formType;
  final VoidCallback? onPressed;

  const CustomForm({
    Key? key,
    required this.textfieldName,
    required this.hintText,
    required this.formType,
    this.onPressed,
  }) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textfieldName,
          style: GoogleFonts.lexend(
            fontWeight: FontWeight.w400,
            color: Color(0xffCB4036),
          ),
        ),
        SizedBox(height: 6),
        if (widget.formType == FormType.Normal)
          SizedBox(
            height: 40,
            child: TextField(
              autocorrect: false,
              enableSuggestions: false,
              obscureText: false,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: GoogleFonts.lexend(),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(200.0),
                ),
                filled: true,
                fillColor: const Color(0xffEFEFEF),
              ),
            ),
          ),
        if (widget.formType == FormType.Password)
          SizedBox(
            height: 40,
            child: TextField(
              autocorrect: false,
              enableSuggestions: false,
              obscureText: _obscureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });

                    // Invoke the callback if it's not null
                    if (widget.onPressed != null) {
                      widget.onPressed!();
                    }
                  },
                ),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.lexend(),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(200.0),
                ),
                filled: true,
                fillColor: const Color(0xffEFEFEF),
              ),
            ),
          ),
      ],
    );
  }
}
