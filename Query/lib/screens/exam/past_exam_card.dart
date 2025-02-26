import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/screens/exam/examReport/exam_report_screen.dart';

class PastExamScreen extends StatelessWidget {
  final List<Map<String, String>> pastExams = [
    {
      "title": "Mathematics Test",
      "subject": "Mathematics",
      "topic": "Algebra and Geometry",
      "result": "85"
    },
    {
      "title": "Physics Test",
      "subject": "Physics",
      "topic": "Mechanics and Thermodynamics",
      "result": "90"
    },
    {
      "title": "Chemistry Test",
      "subject": "Chemistry",
      "topic": "Organic and Inorganic Chemistry",
      "result": "78"
    }
  ];

  Color getScoreColor(double score) {
    if (score >= 85) {
      return Colors.greenAccent;
    } else if (score >= 70) {
      return Colors.orangeAccent;
    } else {
      return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pastExams.length,
      itemBuilder: (context, index) {
        final exam = pastExams[index];
        double score = double.parse(exam["result"]!);
        Color scoreColor = getScoreColor(score);

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.foreground),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Circular Progress Indicator for Score
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 50, // Increased width for a larger circle
                      height: 50,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: score / 100),
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOut,
                        builder: (context, value, child) {
                          return Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: value,
                                strokeWidth: 6,
                                backgroundColor: Colors.white.withOpacity(0.2),
                                valueColor: AlwaysStoppedAnimation(scoreColor),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Text(
                      "${exam["result"]}%",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: scoreColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // Exam Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exam["title"]!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${exam["subject"]} • ${exam["topic"]}",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // View Details Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.foreground,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: AppColors.primary)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExamReportScreen()),
                    );
                  },
                  child: const Text(
                    "View",
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
