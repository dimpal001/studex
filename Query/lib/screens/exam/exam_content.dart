import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/exam/challenge_exam_card.dart';
import 'package:my_flutter_app/screens/exam/createExam/create_exam.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exams",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
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
                  UpcomingExamCard(),
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
                  PastExamScreen()
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primary,
        // onPressed: () => _openAddExamSheet(context),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateExamScreen())),
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
