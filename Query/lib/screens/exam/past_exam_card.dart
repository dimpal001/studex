import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/api_headers.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/constants/error_component.dart';
import 'package:my_flutter_app/screens/exam/examReport/exam_report_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PastExamScreen extends StatefulWidget {
  @override
  _PastExamScreenState createState() => _PastExamScreenState();
}

class _PastExamScreenState extends State<PastExamScreen> {
  // States for managing API data, loading, and error
  List<Map<String, dynamic>> pastExams = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchPastExams();
  }

  // Function to fetch data from API
  Future<void> fetchPastExams() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final headers = await getCustomHeaders();
    final url = Uri.parse('$baseUrl/exam/get-past-exams?userId=$userId');

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Ensure the response contains the "exams" key and it's a List
        if (data.containsKey("exams") && data["exams"] is List) {
          setState(() {
            pastExams = (data["exams"] as List)
                .map((exam) => Map<String, dynamic>.from(exam))
                .toList();
            isLoading = false;
          });
        } else {
          throw Exception('Invalid API response format');
        }
      } else {
        throw Exception('Failed to load exams: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
      print('Error: $e');
    }
  }

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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Conditional rendering based on state
            Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    )
                  : hasError
                      ? ErrorComponent(
                          message: "Failed to load exams. Please try again.",
                          onReload: fetchPastExams,
                        )
                      : pastExams.isEmpty
                          ? Center(
                              child: Text(
                                "No exams available.",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: pastExams.length,
                              itemBuilder: (context, index) {
                                final exam = pastExams[index];
                                double score = exam["result"]?.toDouble() ?? 0;
                                Color scoreColor = getScoreColor(score);

                                return Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.foreground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Circular Progress Indicator for Score
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 50,
                                              child:
                                                  TweenAnimationBuilder<double>(
                                                tween: Tween<double>(
                                                    begin: 0, end: score / 100),
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves.easeOut,
                                                builder: (context, value, _) {
                                                  return CircularProgressIndicator(
                                                    value: value,
                                                    strokeWidth: 6,
                                                    backgroundColor: Colors
                                                        .white
                                                        .withOpacity(0.2),
                                                    valueColor:
                                                        AlwaysStoppedAnimation(
                                                            scoreColor),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                exam["name"],
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
                                            backgroundColor:
                                                AppColors.foreground,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              side: BorderSide(
                                                  color: AppColors.primary),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ExamReportScreen(
                                                  examResult: exam,
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            "View",
                                            style: TextStyle(
                                                color: AppColors.primary),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
            ),
          ],
        ),
      ),
    );
  }
}
