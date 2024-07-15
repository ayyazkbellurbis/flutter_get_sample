import 'package:flutter/material.dart';

class SnackBarUtility {
  static void showSnackBar(BuildContext context, String message,
      {String? action, VoidCallback? actionOnPressed}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: action == null || actionOnPressed == null
            ? null
            : SnackBarAction(
                label: action,
                onPressed: actionOnPressed,
              ),
      ),
    );
  }
}
