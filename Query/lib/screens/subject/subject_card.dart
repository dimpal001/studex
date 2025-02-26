import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/screens/chapter/chapter_screen.dart';

class SubjectCard extends StatelessWidget {
  final String id;
  final String name;
  final int chapters;
  final int topics;
  final int questions;
  final int progress;

  const SubjectCard({
    Key? key,
    required this.id,
    required this.name,
    required this.chapters,
    required this.topics,
    required this.questions,
    required this.progress,
  }) : super(key: key);

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
      borderRadius: BorderRadius.circular(10),
      child: Card(
        color: AppColors.foreground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(getSubjectIcon(), color: Colors.red, size: 28),
                  SizedBox(width: 8),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,
                      color: Colors.white60, size: 18),
                ],
              ),
              SizedBox(height: 4),
              Text(
                "$chapters Chapters • $topics Topics",
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
              SizedBox(height: 12),
              Row(
                spacing: 12,
                children: [
                  _infoBox("Progress", "$progress%"),
                  _infoBox("Questions", "$questions"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoBox(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
          SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
