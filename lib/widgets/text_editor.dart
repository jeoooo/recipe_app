import 'package:flutter/material.dart';
import 'package:flutter_summernote/flutter_summernote.dart';

class TextEditor extends StatelessWidget {
  const TextEditor({
    super.key,
    required GlobalKey<FlutterSummernoteState> keyEditor,
  }) : _keyEditor = keyEditor;

  final GlobalKey<FlutterSummernoteState> _keyEditor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
      child: FlutterSummernote(
        hasAttachment: false,
        height: 200, // Adjust the height as needed
        hint: "Your text here...",
        key: _keyEditor,
        customToolbar: """
      [
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['font', ['strikethrough', 'superscript', 'subscript']]
      ]""",
      ),
    );
  }
}
