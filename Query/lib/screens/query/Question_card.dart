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
      onTap: () {
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
      },
      child: Card(
        color: const Color(0xFF292935),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
                          fontSize: 20,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                subject,
                style: const TextStyle(fontSize: 12, color: Color(0xFFF0363F)),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  IconButton(
                    iconSize: 18,
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up_alt_outlined,
                        color: Colors.white70),
                  ),
                  IconButton(
                    iconSize: 18,
                    onPressed: () {},
                    icon: const Icon(Icons.comment_outlined,
                        color: Colors.white70),
                  ),
                  IconButton(
                    iconSize: 18,
                    onPressed: () {},
                    icon:
                        const Icon(Icons.share_outlined, color: Colors.white70),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
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
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    child: Text("Answer"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
