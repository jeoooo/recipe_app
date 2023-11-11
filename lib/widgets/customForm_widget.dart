import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FormType {
  Normal,
  Password,
  NumberInput,
}

class CustomForm extends StatefulWidget {
  final String textfieldName;
  final String hintText;
  final FormType formType;
  final VoidCallback? onPressed;
  final bool showError;
  final String errorMessage;

  const CustomForm({
    Key? key,
    required this.textfieldName,
    required this.hintText,
    required this.formType,
    this.onPressed,
    this.showError = false,
    this.errorMessage = '',
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
        if (widget.formType == FormType.Normal ||
            widget.formType == FormType.NumberInput)
          _buildTextField(),
        if (widget.formType == FormType.Password) _buildPasswordField(),
        if (widget.showError) _buildErrorText(),
      ],
    );
  }

  Widget _buildTextField() {
    return SizedBox(
      height: 40,
      child: TextField(
        autocorrect: false,
        enableSuggestions: false,
        obscureText:
            widget.formType == FormType.Password ? _obscureText : false,
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

              // Invoke the callback if it's not null
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
    return Container(
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
