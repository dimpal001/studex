import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/screens/query/query_screen.dart';

class QuestionSection extends StatefulWidget {
  final String subjectId;
  final String subjectName;

  const QuestionSection({
    Key? key,
    required this.subjectId,
    required this.subjectName,
  }) : super(key: key);

  @override
  _QuestionSectionState createState() => _QuestionSectionState();
}

class _QuestionSectionState extends State<QuestionSection> {
  final List<Map<String, String>> questions = [
    {
      "question": "What is Newton’s First Law?",
      "answer": "An object remains at rest unless acted upon."
    },
    {
      "question": "Define Thermodynamics.",
      "answer": "Study of heat and energy transformation."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 15, bottom: 80),
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Card(
              color: AppColors.foreground,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ExpansionTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  questions[index]['question']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  "Tap to see answer",
                  style: TextStyle(color: Colors.white70),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          questions[index]['answer']!,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.copy, color: Colors.white70),
                              onPressed: () {
                                // Add copy functionality
                              },
                              tooltip: "Copy",
                            ),
                            IconButton(
                              icon: Icon(Icons.share, color: Colors.white70),
                              onPressed: () {
                                // Add share functionality
                              },
                              tooltip: "Share",
                            ),
                            IconButton(
                              icon: Icon(Icons.bookmark_border,
                                  color: Colors.white70),
                              onPressed: () {
                                // Add bookmark functionality
                              },
                              tooltip: "Bookmark",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton.extended(
            backgroundColor: AppColors.primary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QueryScreen(),
                ),
              );
            },
            label: Row(
              children: [
                Icon(Icons.question_answer, color: Colors.white),
                SizedBox(width: 5),
                Text("Ask Question", style: TextStyle(color: Colors.white)),
              ],
            ),
            elevation: 6,
          ),
        ),
      ],
    );
  }
}
