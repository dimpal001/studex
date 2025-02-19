import 'package:flutter/material.dart';

enum SnackbarType { success, error, defaultType }

class Alert {
  static void show(
    BuildContext context,
    String message, {
    SnackbarType type = SnackbarType.defaultType,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color bgColor;
    switch (type) {
      case SnackbarType.success:
        bgColor = Colors.green;
        break;
      case SnackbarType.error:
        bgColor = Colors.red;
        break;
      case SnackbarType.defaultType:
      default:
        bgColor = Colors.blueGrey;
    }

    // Show the SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: bgColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: "Close",
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
