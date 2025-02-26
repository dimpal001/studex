import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/screens/exam/challenge_exam_card.dart';
import 'package:my_flutter_app/screens/exam/past_exam_card.dart';
import 'package:my_flutter_app/screens/exam/tab_bar_widget.dart';
import 'package:my_flutter_app/screens/exam/upcoming_exam_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExamContent extends StatefulWidget {
  const ExamContent({super.key});

  @override
  State<ExamContent> createState() => _ExamContentState();
}

class _ExamContentState extends State<ExamContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _examNameController = TextEditingController();
  final TextEditingController _noOfQuestionsController =
      TextEditingController();
  final TextEditingController _totalMarksController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _topicController = TextEditingController();

  String? _selectedSubject;
  String? _selectedLanguage;
  List<Map<String, dynamic>> subjects = [];
  final List<Map<String, dynamic>> languages = [
    {"id": 1, "name": "English"},
    {"id": 2, "name": "Hindi"},
    {"id": 3, "name": "Assamese"},
    {"id": 4, "name": "Bengali"},
  ];

  // Sample exam data
  final List<Map<String, dynamic>> upcomingExams = [
    {
      "title": "Mathematics Weekly Test",
      "subtitle": "Algebra • Quadratic Equations",
      "duration": "45 minutes",
      "questions": "25 Questions",
      "timeLeft": "2d left"
    },
  ];

  final List<Map<String, dynamic>> challengeExams = [
    {
      "title": "Physics MCQ Test",
      "subtitle": "Motion and Forces",
      "duration": "30 minutes",
      "questions": "20 Questions",
      "timeLeft": "24h left"
    },
  ];

  final List<Map<String, dynamic>> pastExams = [
    {"name": "Math Test", "subject": "Math", "topic": "Algebra", "result": 85},
    {
      "name": "Science Quiz",
      "subject": "Science",
      "topic": "Physics",
      "result": 78
    },
    {
      "name": "History Exam",
      "subject": "History",
      "topic": "World War II",
      "result": 90
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    getSubjectsFromAPI();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _examNameController.dispose();
    _noOfQuestionsController.dispose();
    _totalMarksController.dispose();
    _durationController.dispose();
    _topicController.dispose();
    super.dispose();
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

  void _openAddExamSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      backgroundColor: AppColors.foreground,
      isScrollControlled: true,
      builder: (context) => _buildExamForm(context),
    );
  }

  Widget _buildExamForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Create New Exam",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 15),
            _buildTextField(_examNameController, "Exam Name"),
            _buildDropdown(
              label: "Select Subject",
              value: _selectedSubject,
              items: subjects,
              onChanged: (value) => setState(() => _selectedSubject = value),
            ),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                      _noOfQuestionsController, "No. of Questions",
                      isNumeric: true),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildTextField(_totalMarksController, "Total Marks",
                      isNumeric: true),
                ),
              ],
            ),
            _buildDropdown(
              label: "Select Language",
              value: _selectedLanguage,
              items: languages,
              onChanged: (value) => setState(() => _selectedLanguage = value),
            ),
            _buildTextField(_topicController, "Topic"),
            _buildTextField(_durationController, "Duration (in minutes)",
                isNumeric: true),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_examNameController.text.trim().isNotEmpty) {
                    Navigator.pop(context);
                    _createExamFun();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Add Exam",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white38),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<Map<String, dynamic>> items,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        items: items
            .map((item) => DropdownMenuItem(
                  value: item["id"].toString(),
                  child: Text(item["name"]),
                ))
            .toList(),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white38),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
        dropdownColor: AppColors.background,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  void _createExamFun() {
    print('');

    _examNameController.clear();
    _noOfQuestionsController.clear();
    _totalMarksController.clear();
    _durationController.clear();
    _topicController.clear();
    setState(() {
      _selectedSubject = null;
      _selectedLanguage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exams",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.foreground,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBarWidget(tabController: _tabController),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Upcoming Exams
                  UpcomingExamCard(),
                  // Challenge Exams
                  ListView.builder(
                    itemCount: challengeExams.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: ChallengeExamCard(
                        title: challengeExams[index]["title"],
                        subtitle: challengeExams[index]["subtitle"],
                        duration: challengeExams[index]["duration"],
                        questions: challengeExams[index]["questions"],
                        timeLeft: challengeExams[index]["timeLeft"],
                      ),
                    ),
                  ),
                  // Past Exams
                  PastExamScreen()
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: () => _openAddExamSheet(context),
        label: const Row(
          children: [
            Icon(Icons.add, color: Colors.white),
            SizedBox(width: 5),
            Text("New Exam", style: TextStyle(color: Colors.white)),
          ],
        ),
        elevation: 6,
      ),
    );
  }
}
