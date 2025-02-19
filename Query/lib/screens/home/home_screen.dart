import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/constants/bottom_nav_bar.dart';
import 'package:my_flutter_app/constants/encryption.dart';
import 'package:my_flutter_app/screens/notification/notification_screen.dart';
import 'package:my_flutter_app/screens/query/query_screen.dart';
import 'package:my_flutter_app/screens/subject/subject.dart';
import 'package:my_flutter_app/screens/subject/subject_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = 'Loading...';
  int _selectedIndex = 0;
  List<Subject> subjectList = [];

  @override
  void initState() {
    super.initState();
    getData();
    getSubjectsFromAPI();
  }

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? 'Guest';
    });
  }

  Future<void> getSubjectsFromAPI() async {
    final prefs = await SharedPreferences.getInstance();
    final storedSubjects = prefs.getString('subjectsList');

    if (storedSubjects != null) {
      setState(() {
        subjectList = (json.decode(storedSubjects) as List<dynamic>)
            .map((subject) => Subject.fromJson(subject as Map<String, dynamic>))
            .toList();
      });
      return;
    }

    final userId = prefs.getString('userId');

    if (userId == null || userId.isEmpty) {
      return;
    }

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
          return;
        }

        final subjectsData = decryptedResponse["subjects"];

        // Store subjects in SharedPreferences
        await prefs.setString('subjectsList', json.encode(subjectsData));

        setState(() {
          subjectList = (subjectsData as List<dynamic>)
              .map((subject) =>
                  Subject.fromJson(subject as Map<String, dynamic>))
              .toList();
        });

        print('Subjects successfully fetched and stored in SharedPreferences');
      } else {
        print('Failed to fetch subjects: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      print('Error fetching subjects: $e');
      print(stackTrace);
    }
  }

  final List<Map<String, String>> statuses = [
    {'title': 'Active Status', 'avatar': 'A'},
    {'title': 'Pending Request', 'avatar': 'P'},
    {'title': 'Completed Task', 'avatar': 'C'},
    {'title': 'New Alert', 'avatar': 'N'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreenContent(),
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex),
    );
  }

  IconData getSubjectIcon(int index) {
    switch (index) {
      case 0:
        return Icons.science;
      case 1:
        return Icons.book;
      case 2:
        return Icons.calculate;
      case 3:
        return Icons.language;
      case 4:
        return Icons.flag;
      default:
        return Icons.help;
    }
  }

  String getSubjectName(int index) {
    switch (index) {
      case 0:
        return "Science";
      case 1:
        return "Chemistry";
      case 2:
        return "Mathematics";
      case 3:
        return "English";
      case 4:
        return "Assamese";
      default:
        return "Unknown";
    }
  }

  Widget subjectIcon(IconData icon, String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFF222252),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(name),
      ],
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Dimpal Das",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.foreground,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 5),
              child: CircleAvatar(
                // backgroundImage: AssetImage('assets/profile.jpg'),
                radius: 17,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(13),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    print('Search');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF292935),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8.0),
                        Text(
                          'Search question...',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QueryScreen()));
                      },
                      child: Card(
                        color: Color(0xFF292935),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 170,
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 22),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25.0,
                                backgroundColor: const Color(0xFF463132),
                                child: Icon(
                                  Icons.question_answer,
                                  color: Color(0xFFF0363F),
                                  size: 25,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Ask Question',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubjectScreen()));
                      },
                      child: Card(
                        color: Color(0xFF292935),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 170,
                          padding: EdgeInsets.all(22),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25.0,
                                backgroundColor: const Color(0xFF463132),
                                child: Icon(
                                  Icons.menu_book,
                                  color: Color(0xFFF0363F),
                                  size: 25,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'My Subjects',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Column(
                  children: [
                    Text(
                      'Recent Questions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Card(
                        color: Color(0xFF292935),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sample Question ${index + 1}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Mathematics - Chapter 2',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  '${index + 1} hr ago',
                                  style: TextStyle(
                                    color: const Color(0xFFF0363F),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ));
  }
}
