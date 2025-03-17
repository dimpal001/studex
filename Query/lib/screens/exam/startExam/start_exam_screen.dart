import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/api_headers.dart';
import 'dart:convert';
import 'package:my_flutter_app/constants/error_component.dart';
import 'package:my_flutter_app/screens/exam/examAttempt/exam_attempt_screen.dart';

class StartExamScreen extends StatefulWidget {
  final String examId;

  const StartExamScreen({super.key, required this.examId});

  @override
  _StartExamScreenState createState() => _StartExamScreenState();
}

class _StartExamScreenState extends State<StartExamScreen> {
  late Future<Map<String, dynamic>> _examFuture;

  @override
  void initState() {
    super.initState();
    _examFuture = fetchExamData();
  }

  void _fetchData() {
    setState(() {
      _examFuture = fetchExamData();
    });
  }

  Future<Map<String, dynamic>> fetchExamData() async {
    final url =
        Uri.parse('$baseUrl/exam/get-single-exam?examId=${widget.examId}');
    final headers = await getCustomHeaders();
    try {
      final response = await http.get(url, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['exam'];
      } else {
        throw Exception('Failed to load exam data');
      }
    } catch (e) {
      throw Exception('Error fetching exam data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder<Map<String, dynamic>>(
        future: _examFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return ErrorComponent(
              message: "Something went wrong",
              onReload: _fetchData,
            );
          } else if (!snapshot.hasData) {
            return ErrorComponent(
              message: "No exam data available",
              onReload: _fetchData,
            );
          }

          final examData = snapshot.data!;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(
                  "Exam Details",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            examData["name"],
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${examData["subject"]["name"]} • ${examData["topic"]}",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withAlpha(170),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildInfoChip(
                                icon: Icons.timer,
                                label: "${examData["duration"]} min",
                              ),
                              _buildInfoChip(
                                icon: Icons.question_answer,
                                label: "${examData["noOfQuestions"]} Qs",
                              ),
                              _buildInfoChip(
                                icon: Icons.person,
                                label: examData["user"]["fullName"],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Details Section
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About this Exam",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildDetailItem(
                            icon: Icons.calendar_today,
                            title: "Created On",
                            value: _formatDate(examData["createdAt"]),
                          ),
                          const SizedBox(height: 16),
                          _buildDetailItem(
                            icon: Icons.format_list_numbered,
                            title: "Questions",
                            value:
                                "${examData["noOfQuestions"]} Multiple Choice",
                          ),
                          const SizedBox(height: 16),
                          _buildDetailItem(
                            icon: Icons.timer,
                            title: "Duration",
                            value: "${examData["duration"]} Minutes",
                          ),
                        ],
                      ),
                    ),
                    // Start Button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExamAttemptScreen(
                                  examId: examData["id"],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // elevation: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.play_arrow, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "Start Exam Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.greenAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.greenAccent),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(
      {required IconData icon, required String title, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon,
              color: Theme.of(context).colorScheme.primary, size: 25),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(180),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return "${date.day}-${date.month}-${date.year}";
  }
}
