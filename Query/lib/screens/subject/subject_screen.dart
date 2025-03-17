import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/error_component.dart';
import 'package:my_flutter_app/screens/subject/subject.dart';
import 'package:my_flutter_app/screens/subject/subject_card.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubjectScreen extends StatefulWidget {
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  String userId = '';
  List<Subject> subjectList = [];
  String errorMessage = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserIdAndSubjects();
  }

  Future<void> fetchUserIdAndSubjects() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedUserId = prefs.getString('userId');

    getSubjectsFromAPI();

    if (storedUserId != null) {
      setState(() {
        userId = storedUserId;
      });
      getSubjectsFromAPI();
    } else {
      setState(() {
        errorMessage = "User ID not found in SharedPreferences";
        isLoading = false;
      });
    }
  }

  Future<void> getSubjectsFromAPI() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedUserId = prefs.getString('userId');
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/user/get-subjects?userId=$storedUserId'),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        final subjectsData = responseData["resData"];

        print(subjectsData);

        setState(() {
          subjectList = (subjectsData as List<dynamic>)
              .map((subject) =>
                  Subject.fromJson(subject as Map<String, dynamic>))
              .toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to fetch subjects';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subjects",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              //
            },
          ),
        ],
      ),
      body: isLoading
          ? Skeletonizer(
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SubjectCard(
                      id: '01',
                      name: 'Unknown',
                      chapters: 20,
                      topics: 20,
                      questions: 20,
                      progress: 50,
                    );
                  }))
          : errorMessage.isNotEmpty
              ? ErrorComponent(
                  message: 'Something went wrong',
                  onReload: getSubjectsFromAPI,
                )
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: subjectList.length,
                  itemBuilder: (context, index) {
                    final subject = subjectList[index];
                    return SubjectCard(
                      id: subject.subjectId,
                      name: subject.name,
                      chapters: 20,
                      topics: 20,
                      questions: 20,
                      progress: 50,
                    );
                  },
                ),
    );
  }
}
