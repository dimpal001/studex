import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/markdown_stylesheet.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionScreen extends StatefulWidget {
  final String questionId;

  const QuestionScreen({Key? key, required this.questionId}) : super(key: key);

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
      print('Error fetching questions: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceContainer,
        title: Text(
          "Question Details",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question Card
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withAlpha(30))),
                          color: colorScheme.surfaceContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MarkdownBody(
                                  data: questionData!["content"],
                                  styleSheet: buildMarkdownStyleSheet(context),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color:
                                            colorScheme.primary.withAlpha(20),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        Icons.book,
                                        size: 20,
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        questionData!["subject"]?["name"] ??
                                            "No subject",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color:
                                            colorScheme.primary.withAlpha(50),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Text(
                                        timeago.format(DateTime.parse(
                                            questionData!["createdAt"])),
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: colorScheme.onSurface
                                              .withAlpha(160),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Answer Card
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withAlpha(30))),
                          color: colorScheme.surface,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green.withAlpha(30),
                                      ),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.green.shade600,
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      "Top Answer",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                AnimatedBuilder(
                                  animation: _revealAnimation,
                                  builder: (context, child) {
                                    return ClipRect(
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        heightFactor: _revealAnimation.value,
                                        child: MarkdownBody(
                                          data: questionData!["answers"][0]
                                              ["content"],
                                          styleSheet:
                                              buildMarkdownStyleSheet(context),
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
