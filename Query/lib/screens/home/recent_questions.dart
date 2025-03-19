import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/screens/query/history/history_screen.dart';
import 'package:my_flutter_app/screens/query/history/question_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecentQuestions extends StatefulWidget {
  const RecentQuestions({super.key});

  @override
  _RecentQuestionsState createState() => _RecentQuestionsState();
}

class _RecentQuestionsState extends State<RecentQuestions> {
  List<dynamic> questions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('userId');

    final url =
        Uri.parse('$baseUrl/question/latest-questions?userId=$userId&page=0');
    try {
      final response = await http.get(url);
      print("API Response: ${response.body}");
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          questions = data['resData'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      print('Error fetching questions: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Recent Questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryScreen()),
                );
              },
              child: Text(
                'See more',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Skeletonizer(
          enabled: isLoading,
          child: ListView.builder(
            itemCount: isLoading ? 5 : questions.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (isLoading) {
                return QuestionCard(
                  questionId: 'Unknown',
                  title: 'No content available',
                  subject: 'Unknown',
                  createdAt: DateTime.now(),
                );
              } else {
                final question = questions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: QuestionCard(
                    questionId: question["id"] ?? 'Hii',
                    title: question['content'] ?? 'No content available',
                    subject: (question['subject'] != null &&
                            question['subject']['name'] != null)
                        ? question['subject']['name']
                        : 'Unknown',
                    createdAt: question['createdAt'] != null
                        ? DateTime.parse(question['createdAt'])
                        : DateTime.now(),
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
