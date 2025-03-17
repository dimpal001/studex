import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/custom_snackbar.dart';
import 'package:my_flutter_app/screens/exam/exam_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CreateExamScreen extends StatefulWidget {
  const CreateExamScreen({super.key});

  @override
  State<CreateExamScreen> createState() => _CreateExamScreenState();
}

class _CreateExamScreenState extends State<CreateExamScreen> {
  final _formKey = GlobalKey<FormState>();
  String examName = '';
  List<Map<String, dynamic>> subjects = [];
  String? selectedSubject;
  String topicName = '';
  double noOfQuestions = 5;
  double totalMarks = 5;
  double duration = 2;
  String selectedLanguage = 'English';
  String difficultyLevel = 'easy';
  bool isSubmitting = false;

  final List<String> languages = ['English', 'Spanish', 'French', 'German'];

  @override
  void initState() {
    super.initState();
    getSubjectsFromAPI();
  }

  Future<void> getSubjectsFromAPI() async {
    final prefs = await SharedPreferences.getInstance();
    final storedSubjects = prefs.getString('subjectsList');

    if (storedSubjects != null) {
      List<dynamic> fetchedSubjects = jsonDecode(storedSubjects);
      setState(() {
        subjects = fetchedSubjects
            .map((subject) => {
                  "id": subject["subject"]["id"],
                  "name": subject["subject"]["name"]
                })
            .toList();
      });
    }
  }

  Future<void> createExam() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('userId');

    if (userId == null) {
      CustomSnackbar.show(context,
          message: 'User not found! Please log in.',
          variant: SnackbarVariant.error);
      return;
    }

    if (examName.isEmpty) {
      CustomSnackbar.show(context,
          message: 'Enter exam name', variant: SnackbarVariant.error);
      return;
    }

    if (topicName.isEmpty) {
      CustomSnackbar.show(context,
          message: 'Enter topic name', variant: SnackbarVariant.error);
      return;
    }

    setState(() => isSubmitting = true);

    final Uri url = Uri.parse('$baseUrl/exam/create-exam');

    final Map<String, dynamic> requestBody = {
      'name': examName,
      'userId': userId,
      'subjectId': selectedSubject,
      'topic': topicName,
      'duration': duration.toInt(),
      'noOfQuestions': noOfQuestions.toInt(),
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      print(response.body);

      if (response.statusCode == 200) {
        CustomSnackbar.show(context,
            message: 'Exam created successfully!',
            variant: SnackbarVariant.success);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ExamScreen()),
        );
      } else {
        CustomSnackbar.show(context,
            message: 'Failed to create exam!', variant: SnackbarVariant.error);
      }
    } catch (e) {
      print(e);
      CustomSnackbar.show(context,
          message: 'Failed to create exam!', variant: SnackbarVariant.error);
    } finally {
      setState(() => isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Create New Exam',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          // leading: IconButton(
          //   icon:
          //       const Icon(Icons.arrow_back_rounded), // Custom back button icon
          //   onPressed: () => Navigator.pop(context),
          // ),
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                // Handle action
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    'Exam Name',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Enter exam name",
                        hintStyle: const TextStyle(color: Colors.white54),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      onChanged: (value) => setState(() => examName = value),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Select Subject
                  const Text(
                    'Select Subject',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.white54),
                      ),
                      value: selectedSubject,
                      items: subjects
                          .map((subject) => DropdownMenuItem(
                                value: subject['id'].toString(),
                                child: Text(subject['name'],
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ))
                          .toList(),
                      dropdownColor:
                          Theme.of(context).colorScheme.surfaceContainer,
                      onChanged: (value) =>
                          setState(() => selectedSubject = value),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Topic Name
                  const Text(
                    'Topic Name',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Enter Topic Name",
                        hintStyle: const TextStyle(color: Colors.white54),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      onChanged: (value) => setState(() => topicName = value),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Number of Questions
                  _buildRangeSelector(
                    'Number of Questions',
                    noOfQuestions,
                    5,
                    30,
                    (value) => setState(() => noOfQuestions = value),
                  ),
                  const SizedBox(height: 16),

                  // Total Marks
                  _buildRangeSelector(
                    'Total Marks',
                    totalMarks,
                    5,
                    30,
                    (value) => setState(() => totalMarks = value),
                  ),
                  const SizedBox(height: 16),

                  // Duration
                  _buildRangeSelector(
                    'Duration (minutes)',
                    duration,
                    2,
                    15,
                    (value) => setState(() => duration = value),
                  ),
                  const SizedBox(height: 16),

                  // Select Language
                  const Text(
                    'Select Language',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.white54),
                      ),
                      value: languages.contains(selectedLanguage)
                          ? selectedLanguage
                          : null,
                      items: languages
                          .map((lang) => DropdownMenuItem(
                                value: lang,
                                child: Text(lang,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ))
                          .toList(),
                      dropdownColor:
                          Theme.of(context).colorScheme.surfaceContainer,
                      onChanged: (value) =>
                          setState(() => selectedLanguage = value!),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text('Difficulty Level',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10,
                    children: ['easy', 'medium', 'hard'].map((level) {
                      bool isSelected = difficultyLevel == level;
                      return ElevatedButton(
                        onPressed: () =>
                            setState(() => difficultyLevel = level),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          foregroundColor: isSelected
                              ? Colors.white
                              : Theme.of(context).colorScheme.primary,
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(level.capitalize()),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isSubmitting
                  ? null
                  : () async {
                      if (_formKey.currentState!.validate()) {
                        // setState(() => isSubmitting = true);

                        await createExam(); // Call the function

                        // setState(() => isSubmitting = false);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ExamScreen()),
                        // );
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: isSubmitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : const Text(
                      'Generate Exam',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
            ),
          ),
        ));
  }

  Widget _buildRangeSelector(String label, double value, double min, double max,
      Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value.round()}'),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: (max - min).round(),
          label: value.round().toString(),
          activeColor: Theme.of(context).colorScheme.primary,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
