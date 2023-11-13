// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

enum DialogButtonType {
  ok,
  okCancel,
}

class CustomAlertDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    DialogButtonType buttonType = DialogButtonType.ok,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: _buildActions(context, buttonType),
        );
      },
    );
  }

  static List<Widget> _buildActions(
      BuildContext context, DialogButtonType buttonType) {
    switch (buttonType) {
      case DialogButtonType.ok:
        return [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ];
      case DialogButtonType.okCancel:
        return [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // Add your logic for handling OK button press here
            },
            child: Text('OK'),
          ),
        ];
    }
  }
}
