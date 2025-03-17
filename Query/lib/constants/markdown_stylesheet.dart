import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

MarkdownStyleSheet buildMarkdownStyleSheet(BuildContext context) {
  return MarkdownStyleSheet(
    p: TextStyle(
        fontSize: 20,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    h1: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    h2: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    h3: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    h4: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    h5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    em: TextStyle(
        fontStyle: FontStyle.italic,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    strong: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    del: TextStyle(
        decoration: TextDecoration.lineThrough,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    blockquote: TextStyle(
      fontSize: 18,
      fontStyle: FontStyle.italic,
      color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
    ),
    blockquotePadding: const EdgeInsets.all(8),
    blockquoteDecoration: BoxDecoration(
      color: Colors.grey[100],
      border: const Border(left: BorderSide(color: Colors.grey, width: 4)),
    ),
    code: TextStyle(
      fontSize: 14,
      fontFamily: 'monospace',
      color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
      backgroundColor: Colors.black12,
    ),
    codeblockPadding: const EdgeInsets.all(8),
    codeblockDecoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(4),
    ),
    listBullet: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    unorderedListAlign: WrapAlignment.start,
    orderedListAlign: WrapAlignment.start,
    tableHead: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    tableBody: TextStyle(
        fontSize: 14,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
    tableBorder: TableBorder.all(color: Colors.grey),
    horizontalRuleDecoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 2.0, color: Colors.grey[300]!),
      ),
    ),
    checkbox: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
  );
}
