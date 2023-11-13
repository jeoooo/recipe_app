// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FormType {
  Normal,
  Password,
  NumberInput,
  MultiLineText, // Added MultiLineText form type
}

class CustomForm extends StatefulWidget {
  final String textfieldName;
  final String? hintText;
  final FormType formType;
  final VoidCallback? onPressed;
  final bool showError;
  final String errorMessage;

  final TextEditingController? controller;

  const CustomForm({
    Key? key,
    required this.textfieldName,
    this.hintText,
    required this.formType,
    this.onPressed,
    this.showError = false,
    this.errorMessage = '',
    this.controller,
  }) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

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
        _buildFormInput(),
        if (widget.showError) _buildErrorText(),
      ],
    );
  }

  Widget _buildFormInput() {
    switch (widget.formType) {
      case FormType.Normal:
      case FormType.MultiLineText: // Added MultiLineText case
        return _buildTextField();
      case FormType.Password:
        return _buildPasswordField();
      case FormType.NumberInput:
        return _buildTextField(); // Use the same text field for number input
    }
  }

  Widget _buildTextField() {
    return SizedBox(
      height: widget.formType == FormType.MultiLineText ? 80 : 40,
      child: TextField(
        controller: _controller,
        autocorrect: false,
        enableSuggestions: false,
        maxLines: widget.formType == FormType.MultiLineText ? null : 1,
        keyboardType: widget.formType == FormType.NumberInput
            ? TextInputType.number
            : TextInputType.text,
        decoration: _buildInputDecoration(),
      ),
    );
  }

  Widget _buildPasswordField() {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: _controller,
        autocorrect: false,
        enableSuggestions: false,
        obscureText: _obscureText,
        keyboardType: TextInputType.text,
        decoration: _buildInputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });

              if (widget.onPressed != null) {
                widget.onPressed!();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildErrorText() {
    return SizedBox(
      width: 325,
      child: Text(
        widget.errorMessage,
        style: GoogleFonts.lexend(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({Widget? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      hintText: widget.hintText,
      hintStyle: GoogleFonts.lexend(),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(200.0),
      ),
      filled: true,
      fillColor: const Color(0xffEFEFEF),
    );
  }
}
