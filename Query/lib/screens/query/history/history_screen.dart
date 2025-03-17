import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'dart:convert';
import 'question_card.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<dynamic> questions = [];
  int page = 0;
  bool isLoading = false;
  bool hasMore = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchQuestions();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 50 &&
          !isLoading &&
          hasMore) {
        fetchQuestions();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('userId');

    if (isLoading || !hasMore) return;

    setState(() => isLoading = true);

    final url = Uri.parse(
        '$baseUrl/question/latest-questions?userId=$userId&page=$page');

    try {
      final response = await http.get(url);
      print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data == null || data['resData'] == null) {
          print("Error: resData is null!");
          setState(() => hasMore = false);
          return;
        }

        final List<dynamic> newQuestions = data['resData'] ?? [];

        if (newQuestions.isNotEmpty) {
          setState(() {
            page++;
            questions.addAll(newQuestions);
          });
        } else {
          setState(() => hasMore = false);
        }
      } else {
        print('Server Error: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching data: $e");
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Questions",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          backgroundColor: colorScheme.surfaceContainer,
        ),
        body: Skeletonizer(
          enabled: isLoading,
          child: ListView.builder(
              itemCount: isLoading ? 5 : questions.length + (hasMore ? 1 : 0),
              controller: _scrollController,
              padding: EdgeInsets.all(12),
              itemBuilder: (context, index) {
                if (isLoading) {
                  return QuestionCard(
                    questionId: '01',
                    title: 'No content available',
                    subject: 'Unknown',
                    createdAt: DateTime.now(),
                  );
                } else if (index < questions.length) {
                  final question = questions[index];

                  return QuestionCard(
                    questionId: question["id"],
                    title: question['content'] ?? 'No content available',
                    subject: (question['subject'] != null &&
                            question['subject']['name'] != null)
                        ? question['subject']['name']
                        : 'Unknown',
                    createdAt: question['createdAt'] != null
                        ? DateTime.parse(question['createdAt'])
                        : DateTime.now(),
                  );
                } else {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
        ));
  }
}
