import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/constants/bottom_nav_bar.dart';
import 'package:my_flutter_app/screens/subject/subject.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExamScreen extends StatefulWidget {
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  final Color primaryColor = const Color(0xFFF0363F);
  final Color buttonColor = const Color(0xFF292935);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExamScreenContent(),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}

class ExamScreenContent extends StatelessWidget {
  final List<Map<String, dynamic>> previousExams = [
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exams",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.foreground,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              //
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBarWidget(),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ChallengeExamCard(
                    title: "Physics MCQ Test",
                    subtitle: "Motion and Forces",
                    duration: "30 minutes",
                    questions: "20 Questions",
                    timeLeft: "24h left",
                  ),
                  SizedBox(height: 12),
                  ExamCard(
                    title: "Mathematics Weekly Test",
                    subtitle: "Algebra • Quadratic Equations",
                    duration: "45 minutes",
                    questions: "25 Questions",
                    timeLeft: "2d left",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => NewExamDialog(),
          );
        },
      ),
    );
  }
}

class NewExamDialog extends StatefulWidget {
  @override
  _NewExamDialogState createState() => _NewExamDialogState();
}

class _NewExamDialogState extends State<NewExamDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _examNameController = TextEditingController();
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _questionsController = TextEditingController();

  String? _selectedSubject;

  List<Subject> subjectList = [];

  @override
  void initState() {
    super.initState();
    loadSubjectsFromStorage();
  }

  Future<void> loadSubjectsFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final storedSubjects = prefs.getString('subjectsList');

    if (storedSubjects != null) {
      setState(() {
        subjectList = (json.decode(storedSubjects) as List<dynamic>)
            .map((subject) => Subject.fromJson(subject as Map<String, dynamic>))
            .toList();
      });

      print('Loaded subjects from SharedPreferences');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Create New Exam",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exam Name
              TextFormField(
                controller: _examNameController,
                decoration: InputDecoration(
                  labelText: 'Exam Name',
                  hintText: 'Enter the exam name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an exam name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Subject - Dropdown
              DropdownButtonFormField<String>(
                value: _selectedSubject,
                onChanged: (value) {
                  setState(() {
                    _selectedSubject = value;
                  });
                },
                items: subjectList.map((subject) {
                  return DropdownMenuItem(
                    value: subject.name,
                    child: Text(subject.name),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Subject',
                  hintText: 'Select a subject',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a subject';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Topic
              TextFormField(
                controller: _topicController,
                decoration: InputDecoration(
                  labelText: 'Topic',
                  hintText: 'Enter the topic name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a topic';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Duration
              TextFormField(
                controller: _durationController,
                decoration: InputDecoration(
                  labelText: 'Duration',
                  hintText: 'Enter exam duration (e.g., 60 minutes)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a duration';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Number of Questions
              TextFormField(
                controller: _questionsController,
                decoration: InputDecoration(
                  labelText: 'Number of Questions',
                  hintText: 'Enter the number of questions',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of questions';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      actions: [
        // Cancel Button
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: AppColors.primary),
          ),
        ),

        // Create Exam Button
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              // Save the new exam details
              final newExam = {
                'name': _examNameController.text,
                'subject': _selectedSubject,
                'topic': _topicController.text,
                'duration': _durationController.text,
                'questions': _questionsController.text,
              };
              print("New exam created: $newExam");
              Navigator.of(context).pop();
            }
          },
          child: Text('Create Exam'),
        ),
      ],
    );
  }
}

class ChallengeExamCard extends StatelessWidget {
  final String title, subtitle, duration, questions, timeLeft;

  ChallengeExamCard({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.questions,
    required this.timeLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.foreground,
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: AppColors.primary, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Challenge from Rahul",
              style: TextStyle(
                  color: AppColors.primary, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.watch_later, color: Colors.grey, size: 15),
                      SizedBox(width: 5),
                      Text("$duration", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.help_outline, color: Colors.grey, size: 15),
                      SizedBox(width: 5),
                      Text("$questions", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.primary),
                onPressed: () {},
                child: Text("Start Now", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExamCard extends StatelessWidget {
  final String title, subtitle, duration, questions, timeLeft;

  ExamCard({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.questions,
    required this.timeLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.foreground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.watch_later, color: Colors.grey, size: 15),
                      SizedBox(width: 5),
                      Text("$duration", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.help_outline, color: Colors.grey, size: 15),
                      SizedBox(width: 5),
                      Text("$questions", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: AppColors.primary,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text("Start Now",
                    style: TextStyle(color: AppColors.primary)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.foreground),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            TabItem(title: "Upcoming", isSelected: true),
            TabItem(title: "Completed", isSelected: false),
            TabItem(title: "Created", isSelected: false),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  TabItem({required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? AppColors.background : AppColors.transparent),
        child: Center(
          child: Text(title,
              style: TextStyle(
                  color: isSelected ? AppColors.primary : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
        ),
      ),
    );
  }
}
