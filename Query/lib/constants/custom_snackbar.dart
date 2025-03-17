import 'package:flutter/material.dart';

enum SnackbarVariant { success, error, warning, defaultVariant }

class CustomSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    SnackbarVariant variant = SnackbarVariant.defaultVariant,
  }) {
    Color backgroundColor;

    switch (variant) {
      case SnackbarVariant.success:
        backgroundColor = Colors.green;
        break;
      case SnackbarVariant.error:
        backgroundColor = Colors.red;
        break;
      case SnackbarVariant.warning:
        backgroundColor = Colors.orange;
        break;
      case SnackbarVariant.defaultVariant:
        backgroundColor = Colors.blueGrey;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Icon(Icons.close, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
