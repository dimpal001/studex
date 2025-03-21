import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/api_headers.dart';
import 'package:my_flutter_app/constants/confirm_modal.dart';
import 'dart:convert';
import 'package:my_flutter_app/constants/error_component.dart';

class ExamAttemptScreen extends StatefulWidget {
  final String examId;

  const ExamAttemptScreen({super.key, required this.examId});

  @override
  State<ExamAttemptScreen> createState() => _ExamAttemptScreenState();
}

class _ExamAttemptScreenState extends State<ExamAttemptScreen>
    with WidgetsBindingObserver {
  late Timer _timer;
  int _remainingSeconds = 0;
  int _currentQuestionIndex = 0;
  bool _isSubmitting = false;
  late Future<Map<String, dynamic>> _examFuture;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _fetchData();
  }

  void _fetchData() {
    setState(() {
      _examFuture = fetchExamData();
    });
  }

  Future<Map<String, dynamic>> fetchExamData() async {
    final url =
        Uri.parse('$baseUrl/exam/get-detail-exam-data?examId=${widget.examId}');
    final headers = await getCustomHeaders();
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['exam'];
      } else {
        throw Exception('Failed to load exam data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching exam data: $e');
    }
  }

  void _startTimer(int durationInMinutes) {
    _remainingSeconds = durationInMinutes * 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _submitExam();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused && !_isSubmitting) {
      _showExitConfirmation();
    }
  }

  void _submitExam() async {
    setState(() => _isSubmitting = true);
    _timer.cancel();
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pop(context, {'submitted': true});
    }
  }

  void _showExitConfirmation() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: "Exit Exam?",
          description:
              "Are you sure you want to exit? Your progress will be lost",
          variant: Colors.red,
          onConfirm: () {
            Navigator.pop(context);
            Navigator.pop(context, {'submitted': false});
          },
          confirmText: "Exit",
          cancelText: "Continue Exam",
        );
      },
    );
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  void _selectAnswer(Map<String, dynamic> examData, String option) {
    setState(() {
      examData["questions"][_currentQuestionIndex]["userAnswer"] = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _showExitConfirmation();
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: FutureBuilder<Map<String, dynamic>>(
          future: _examFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return ErrorComponent(
                message: snapshot.error.toString(),
                onReload: _fetchData,
              );
            } else if (!snapshot.hasData) {
              return ErrorComponent(
                message: "No exam data available",
                onReload: _fetchData,
              );
            }

            final examData = snapshot.data!;
            if (_remainingSeconds == 0) {
              _startTimer(examData["duration"]);
            }
            final currentQuestion =
                examData["questions"][_currentQuestionIndex];

            return Column(
              children: [
                // AppBar
                AppBar(
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainer,
                  automaticallyImplyLeading: false,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        examData["name"],
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 20),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.timer,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20),
                            const SizedBox(width: 6),
                            Text(
                              _formatTime(_remainingSeconds),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Progress Indicator
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Question ${_currentQuestionIndex + 1}/${examData["noOfQuestions"]}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(
                          value: (_currentQuestionIndex + 1) /
                              examData["noOfQuestions"],
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(180),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                // Question Card
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentQuestion["question"],
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ...["A", "B", "C", "D"]
                                  .map((option) => _buildOption(
                                        examData,
                                        option,
                                        currentQuestion["option$option"],
                                        currentQuestion["userAnswer"],
                                      )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Navigation Buttons
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentQuestionIndex > 0)
                        ElevatedButton(
                          onPressed: () =>
                              setState(() => _currentQuestionIndex--),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.surfaceContainer,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text("Previous",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)),
                        )
                      else
                        const SizedBox(),
                      ElevatedButton(
                        onPressed: _currentQuestionIndex <
                                examData["noOfQuestions"] - 1
                            ? () => setState(() => _currentQuestionIndex++)
                            : _submitExam,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(
                          _currentQuestionIndex < examData["noOfQuestions"] - 1
                              ? "Next"
                              : "Submit",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildOption(Map<String, dynamic> examData, String option, String text,
      String? selectedAnswer) {
    bool isSelected = selectedAnswer == option;

    return GestureDetector(
      onTap: () => _selectAnswer(examData, option),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[700],
              ),
              child: Center(
                child: Text(
                  option,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
