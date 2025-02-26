import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/screens/questions/question_screen.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String subject;
  final String time;
  final String answer;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.subject,
    required this.time,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToQuestionScreen(context),
      child: Card(
        color: AppColors.foreground.withOpacity(0.95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.black.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.book, size: 16, color: AppColors.primary),
                  const SizedBox(width: 6),
                  Text(
                    subject,
                    style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildActionButton(
                        icon: Icons.thumb_up_alt_outlined,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Like action coming soon!")),
                          );
                        },
                        tooltip: 'Like',
                      ),
                      const SizedBox(width: 8),
                      _buildActionButton(
                        icon: Icons.comment_outlined,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Comment action coming soon!")),
                          );
                        },
                        tooltip: 'Comment',
                      ),
                      const SizedBox(width: 8),
                      _buildActionButton(
                        icon: Icons.share_outlined,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Share action coming soon!")),
                          );
                        },
                        tooltip: 'Share',
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => _navigateToQuestionScreen(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary.withOpacity(0.1),
                      foregroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                    child: const Text(
                      "View Answer",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToQuestionScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionScreen(
          question: question,
          subject: subject,
          time: time,
          answer: answer,
        ),
      ),
    );
  }

  Widget _buildActionButton(
      {required IconData icon,
      required VoidCallback onPressed,
      required String tooltip}) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        iconSize: 20,
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white70),
        splashRadius: 20,
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
