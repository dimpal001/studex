import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/chapter/chapter_screen.dart';

class SubjectCard extends StatelessWidget {
  final String id;
  final String name;
  final int chapters;
  final int topics;
  final int questions;
  final int progress;

  const SubjectCard({
    super.key,
    required this.id,
    required this.name,
    required this.chapters,
    required this.topics,
    required this.questions,
    required this.progress,
  });

  IconData getSubjectIcon() {
    switch (name.toLowerCase()) {
      case "mathematics":
        return Icons.calculate;
      case "physics":
        return Icons.science;
      case "chemistry":
        return Icons.biotech;
      case "biology":
        return Icons.eco;
      default:
        return Icons.book;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChapterScreen(
              subjectId: id,
              subjectName: name,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: (MediaQuery.of(context).size.width - 30) / 2,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              getSubjectIcon(),
              color: Theme.of(context).colorScheme.primary,
              size: 40,
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "$chapters Chapters • $topics Topics",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(170),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "Progress $progress%",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
