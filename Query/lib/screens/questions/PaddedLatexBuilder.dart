import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class PaddedLatexBuilder extends MarkdownElementBuilder {
  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8), // Add vertical spacing
      child: Text(
        element.textContent, // Correct way to extract text from Element
        style: const TextStyle(
          fontSize: 15,
          height: 2.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
