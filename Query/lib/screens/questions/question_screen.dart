import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:my_flutter_app/constants/app_color.dart';

class QuestionScreen extends StatelessWidget {
  final String question;
  final String subject;
  final String time;
  final String answer;

  const QuestionScreen({
    Key? key,
    required this.question,
    required this.subject,
    required this.time,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detailed Question",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.foreground,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle options
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 22,
                height: 1.3,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subject,
              style: const TextStyle(fontSize: 14, color: Color(0xFFF0363F)),
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            // Render Markdown and LaTeX
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GptMarkdown(
                      answer,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  iconSize: 24,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up_alt_outlined,
                    color: Colors.white70,
                  ),
                ),
                IconButton(
                  iconSize: 24,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment_outlined,
                    color: Colors.white70,
                  ),
                ),
                IconButton(
                  iconSize: 24,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_outlined,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
