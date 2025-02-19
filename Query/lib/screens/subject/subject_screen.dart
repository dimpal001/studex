import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/constants/encryption.dart';
import 'package:my_flutter_app/screens/subject/subject.dart';
import 'package:my_flutter_app/screens/subject/subject_card.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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

    if (storedUserId != null) {
      setState(() {
        userId = storedUserId;
      });
      getSubjectsFromAPI(userId);
    } else {
      setState(() {
        errorMessage = "User ID not found in SharedPreferences";
        isLoading = false;
      });
    }
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
    }
  }

  Future<void> getSubjectsFromAPI(String userId) async {
    final encryptedData =
        Uri.encodeComponent(Encryption.encryptData({"userId": userId}));

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/user/get-subjects?data=$encryptedData'),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        final decryptedResponse =
            Encryption.decryptData(responseData["resData"]);

        if (decryptedResponse == null ||
            !decryptedResponse.containsKey("subjects") ||
            decryptedResponse["subjects"] == null) {
          setState(() {
            errorMessage = "Error: No subjects found";
            isLoading = false;
          });
          return;
        }

        final subjectsData = decryptedResponse["subjects"];

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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: subjectList.length,
                  itemBuilder: (context, index) {
                    final subject = subjectList[index];
                    return SubjectCard(
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
