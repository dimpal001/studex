import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/questions/question_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class QuestionCard extends StatelessWidget {
  final String questionId;
  final String title;
  final String subject;
  final DateTime createdAt;

  const QuestionCard({
    super.key,
    required this.questionId,
    required this.title,
    required this.subject,
    required this.createdAt,
  });

  void _navigateToDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionScreen(questionId: questionId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final String timeAgo = timeago.format(createdAt, locale: 'en');

    return GestureDetector(
      onTap: () => _navigateToDetailScreen(context),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(30))),
        color: colorScheme.surface,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          color: Colors.transparent,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(12),
          //   gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [
          //       colorScheme.surface,
          //       colorScheme.surfaceContainer.withAlpha(250),
          //     ],
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.file_open,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        subject,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                          letterSpacing: 0.2,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse,
                          color: colorScheme.onSurface.withAlpha(150),
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          timeAgo,
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.onSurface.withAlpha(150),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  title.length > 90 ? '${title.substring(0, 90)}...' : title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
