import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:my_flutter_app/constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:my_flutter_app/constants/custom_bottom_sheet.dart';
import 'package:my_flutter_app/constants/markdown_stylesheet.dart';

class QuestionScreen extends StatefulWidget {
  final String questionId;

  const QuestionScreen({super.key, required this.questionId});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen>
    with SingleTickerProviderStateMixin {
  bool isLoading = true;
  Map<String, dynamic>? questionData;
  late AnimationController _animationController;
  late Animation<double> _revealAnimation;

  @override
  void initState() {
    super.initState();
    _fetchQuestionData(widget.questionId);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _revealAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  Future<void> _fetchQuestionData(String questionId) async {
    final url =
        Uri.parse('$baseUrl/question/detail-question?questionId=$questionId');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          questionData = json.decode(response.body)['resData'];
          isLoading = false;
          _animationController.forward();
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String preprocessLatex(String rawData) {
    if (!rawData.startsWith(r'$') && !rawData.endsWith(r'$')) {
      return r'$' + rawData + r'$';
    }
    return rawData;
  }

  void _showQuestionInfo() {
    if (questionData != null) {
      CustomBottomSheet.show(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question Information',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Class', questionData!['class'] ?? 'Not specified'),
            _buildInfoRow(
                'Subject', questionData!['subject'] ?? 'Not specified'),
            _buildInfoRow(
                'Chapter', questionData!['chapter'] ?? 'Not specified'),
          ],
        ),
      );
    }
  }

  void _showMore() {
    if (questionData != null) {
      CustomBottomSheet.show(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMoreRow(
              icon: Icons.delete_outline,
              label: 'Delete Question',
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Question deleted')),
                );
              },
            ),
            _buildMoreRow(
              icon: Icons.move_down,
              label: 'Move to Another Chapter',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            _buildMoreRow(
              icon: Icons.share,
              label: 'Share with Friend',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreRow({
    required IconData icon,
    required String label,
    VoidCallback? onPressed,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          splashColor: colorScheme.primary.withAlpha(100),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                // Stunning icon design
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    color: colorScheme.primary.withAlpha(50),
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                // Label
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                // Optional indicator for clickable items
                if (onPressed != null)
                  Icon(
                    Icons.chevron_right,
                    color: colorScheme.onSurface.withAlpha(100),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: Text(
          "Question Details",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: colorScheme.onPrimary),
            onPressed: _showQuestionInfo,
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: colorScheme.onPrimary),
            onPressed: _showMore,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colorScheme.surface, colorScheme.surfaceContainerLow],
          ),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: colorScheme.primary,
                  strokeWidth: 3,
                ),
              )
            : questionData == null
                ? Center(
                    child: Text(
                      "Failed to load question",
                      style: TextStyle(
                        fontSize: 20,
                        color: colorScheme.onSurface.withAlpha(140),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: colorScheme.onPrimary.withAlpha(50),
                                  width: 1)),
                          color: colorScheme.surface,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MarkdownBody(
                                  selectable: true,
                                  data: questionData!["content"],
                                  styleSheet: customMarkdownStyleSheet(context),
                                  builders: {
                                    'latex': LatexElementBuilder(
                                      textStyle: const TextStyle(
                                        fontSize: 15,
                                        height: 0.5,
                                      ),
                                      textScaleFactor: 0.95,
                                    ),
                                  },
                                  extensionSet: md.ExtensionSet(
                                    [LatexBlockSyntax()],
                                    [LatexInlineSyntax()],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          color: colorScheme.surface,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AnimatedBuilder(
                                  animation: _revealAnimation,
                                  builder: (context, child) {
                                    return ClipRect(
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        heightFactor: _revealAnimation.value,
                                        child: MarkdownBody(
                                          selectable: true,
                                          data: questionData!["answers"][0]
                                              ["content"],
                                          styleSheet:
                                              customMarkdownStyleSheet(context),
                                          builders: {
                                            'latex': LatexElementBuilder(
                                              textStyle: const TextStyle(
                                                fontSize: 15,
                                                height: 1.5,
                                              ),
                                              textScaleFactor: 0.95,
                                            ),
                                          },
                                          extensionSet: md.ExtensionSet(
                                            [LatexBlockSyntax()],
                                            [LatexInlineSyntax()],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
