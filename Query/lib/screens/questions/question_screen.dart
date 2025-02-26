import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:share_plus/share_plus.dart';

class QuestionScreen extends StatefulWidget {
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
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  bool isLiked = false;
  int likeCount = 0;
  final TextEditingController _commentController = TextEditingController();
  List<String> comments = [];

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  void _addComment() {
    if (_commentController.text.trim().isNotEmpty) {
      setState(() {
        comments.add(_commentController.text.trim());
        _commentController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Comment added!")),
      );
    }
  }

  void _shareContent() {
    Share.share(
      'Check out this question: "${widget.question}"\nSubject: ${widget.subject}\nAnswer: ${widget.answer}',
      subject: 'Question from My Flutter App',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detailed Question",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppColors.foreground,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'copy') {
                Clipboard.setData(ClipboardData(text: widget.answer));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Answer copied to clipboard")),
                );
              } else if (value == 'report') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Report submitted")),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'copy',
                child: ListTile(
                  leading: Icon(Icons.copy, color: Colors.white70),
                  title: Text("Copy Answer",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'report',
                child: ListTile(
                  leading: Icon(Icons.report, color: Colors.white70),
                  title: Text("Report", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
            icon: const Icon(Icons.more_vert, color: Colors.white70),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.question,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.book,
                            size: 16, color: AppColors.primary),
                        const SizedBox(width: 6),
                        Text(
                          widget.subject,
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            widget.time,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Answer Section
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Answer",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: GptMarkdown(
                          widget.answer,
                          // textStyle: const TextStyle(color: Colors.white70, fontSize: 16),
                          // latexStyle: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Comments Section
                      if (comments.isNotEmpty) ...[
                        const Text(
                          "Comments",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        ...comments.map((comment) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.foreground.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(comment,
                                    style:
                                        const TextStyle(color: Colors.white70)),
                              ),
                            )),
                        const SizedBox(height: 16),
                      ],

                      // Comment Input
                      TextField(
                        controller: _commentController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Add a comment...",
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color(0xFF1E1E2A),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.send,
                                color: AppColors.primary),
                            onPressed: _addComment,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton(
                    icon:
                        isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                    label: likeCount > 0 ? '$likeCount' : 'Like',
                    onPressed: _toggleLike,
                    isActive: isLiked,
                  ),
                  _buildActionButton(
                    icon: Icons.comment_outlined,
                    label:
                        comments.isNotEmpty ? '${comments.length}' : 'Comment',
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                  _buildActionButton(
                    icon: Icons.share_outlined,
                    label: 'Share',
                    onPressed: _shareContent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primary.withOpacity(0.2)
              : AppColors.foreground.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isActive ? AppColors.primary : Colors.white70, size: 24),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                  color: isActive ? AppColors.primary : Colors.white70,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
