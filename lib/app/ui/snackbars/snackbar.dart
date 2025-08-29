import 'package:flutter/material.dart';

class SnackbarHelper {
  static void showSuccess(BuildContext context, String message) {
    _showSnackbar(context, message, Colors.green);
  }

  static void showError(BuildContext context, String message) {
    _showSnackbar(context, message, Colors.red);
  }

  static void showWarning(BuildContext context, String message) {
    _showSnackbar(context, message, Colors.orange);
  }

  static void showInfo(BuildContext context, String message) {
    _showSnackbar(context, message, Colors.blue);
  }

  static void _showSnackbar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
