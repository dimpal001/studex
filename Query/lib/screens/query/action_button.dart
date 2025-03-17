import 'package:flutter/material.dart';

Widget buildActionButton(
  BuildContext context,
  IconData icon,
  VoidCallback onTap,
  String tooltip,
) {
  return Tooltip(
    message: tooltip,
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        ),
      ),
    ),
  );
}
