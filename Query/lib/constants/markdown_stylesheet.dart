import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

MarkdownStyleSheet customMarkdownStyleSheet(BuildContext context) {
  return MarkdownStyleSheet(
    p: const TextStyle(
      fontSize: 17,
      height: 1.6,
      fontWeight: FontWeight.w400,
    ),
    h1: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    h2: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    h3: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    horizontalRuleDecoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    ),
    listIndent: 25,
    orderedListAlign: WrapAlignment.start,
    listBullet: const TextStyle(
      fontSize: 17,
      letterSpacing: 2,
      height: 2,
      fontWeight: FontWeight.bold,
    ),
    listBulletPadding: const EdgeInsets.symmetric(horizontal: 0),
    h2Padding: const EdgeInsets.symmetric(vertical: 3),
    h3Padding: const EdgeInsets.symmetric(vertical: 3),
    pPadding: const EdgeInsets.symmetric(vertical: 4),
  );
}
