import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/api_headers.dart';
import 'dart:convert';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/screens/exam/startExam/start_exam_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpcomingExamCard extends StatefulWidget {
  @override
  _UpcomingExamCardState createState() => _UpcomingExamCardState();
}

class _UpcomingExamCardState extends State<UpcomingExamCard> {
  late Future<List<dynamic>> _examsFuture;

  @override
  void initState() {
    super.initState();
    _examsFuture = fetchExams();
  }

  Future<List<dynamic>> fetchExams() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final headers = await getCustomHeaders();
    final url = Uri.parse('$baseUrl/exam/get-upcoming-exams?userId=$userId');
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['exams'];
      } else {
        throw Exception('Failed to load exams');
      }
    } catch (e) {
      throw Exception('Error fetching exams: $e');
    }
  }

  String _calculateDaysLeft(String createdAt) {
    final createdDate = DateTime.parse(createdAt);
    final currentDate = DateTime.now();
    final difference = currentDate.difference(createdDate).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 30) {
      return '$difference days ago';
    } else if (difference < 365) {
      int months = (difference / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      int years = (difference / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: _examsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No exams available'),
            );
          }

          final exams = snapshot.data!;

          return ListView.builder(
            itemCount: exams.length,
            itemBuilder: (context, index) {
              final exam = exams[index];
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.foreground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          exam['name'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Text(
                          _calculateDaysLeft(exam['createdAt']),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${exam["subject"]} • ${exam["topic"]}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.watch_later,
                                    color: Colors.grey, size: 15),
                                SizedBox(width: 5),
                                Text(
                                  '${exam['duration']} min',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.help_outline,
                                    color: Colors.grey, size: 15),
                                SizedBox(width: 5),
                                Text(
                                  '${exam['noOfQuestions']} Questions',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.background,
                            side: BorderSide(
                              color: AppColors.primary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StartExamScreen(
                                  examId: exam["id"],
                                ),
                              ),
                            ).then((result) {
                              if (result != null) {
                                print("Exam completed: $result");
                              }
                            });
                          },
                          child: Text(
                            "Start Now",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
