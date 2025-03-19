import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/screens/chapter/question_card.dart';
import 'package:my_flutter_app/screens/query/query_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:skeletonizer/skeletonizer.dart';

class QuestionSection extends StatefulWidget {
  final String subjectId;
  final String subjectName;

  const QuestionSection({
    super.key,
    required this.subjectId,
    required this.subjectName,
  });

  @override
  _QuestionSectionState createState() => _QuestionSectionState();
}

class _QuestionSectionState extends State<QuestionSection> {
  List<dynamic> chapters = [];
  List<dynamic> questions = [];
  int page = 0;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    fetchQuestions(widget.subjectId);
    fetchChapters();
  }

  Future<void> fetchQuestions(String subjectId) async {
    if (isLoading || !hasMore) return;

    setState(() => isLoading = true);

    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    final url = Uri.parse(
        '$baseUrl/question/question-by-subject?subjectId=$subjectId&userId=$userId&page=$page');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          questions.addAll(data['resData']);
          page++;
          hasMore = questions.length < data['noOfQuestions'];
        });
      }
    } catch (e) {
      print("Error fetching questions: $e");
    }

    setState(() => isLoading = false);
  }

  Future<void> fetchChapters() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse(
          "$baseUrl/chapter/get-chapters?subjectId=${widget.subjectId}&userId=$userId");
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final resData = jsonDecode(response.body);
        setState(() {
          chapters = resData['resData'] ?? [];
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load chapters: ${response.statusCode}");
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent - 100 &&
            !isLoading &&
            hasMore) {
          fetchQuestions(widget.subjectId);
        }
        return false;
      },
      child: Stack(
        children: [
          Skeletonizer(
              enabled: isLoading,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 15, bottom: 80),
                itemCount: 5,
                itemBuilder: (context, index) {
                  if (questions.isEmpty && isLoading) {
                    return Card(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text("${index + 1}",
                              style: const TextStyle(color: Colors.white)),
                        ),
                        title: Text(
                          'Unknown',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.grey),
                      ),
                    );
                  } else if (index == questions.length) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ));
                  }
                  var question = questions[index];
                  return QuestionCard(
                    chapters: chapters,
                    question: question,
                    index: index,
                  );
                },
              )),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton.extended(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QueryScreen(),
                  ),
                );
              },
              label: Row(
                children: const [
                  Icon(Icons.question_answer, color: Colors.white),
                  SizedBox(width: 5),
                  Text("Ask Question", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
