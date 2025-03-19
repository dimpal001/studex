import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/bottom_nav_bar.dart';
import 'package:my_flutter_app/screens/home/home_section.dart';
import 'package:my_flutter_app/screens/home/recent_questions.dart';
import 'package:my_flutter_app/screens/home/shimmer_icon.dart';
import 'package:my_flutter_app/screens/notification/notification_screen.dart';
import 'package:my_flutter_app/screens/profile/profile_screen.dart';
import 'package:my_flutter_app/screens/query/query_screen.dart';
import 'package:my_flutter_app/screens/storyScreen/story_screen.dart';
import 'package:my_flutter_app/screens/subject/subject.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = 'Loading...';
  final int _selectedIndex = 0;
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
    if (userId == null || userId.isEmpty) return;

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/user/get-subjects?userId=$userId'),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        final subjectsData = responseData["resData"];
        await prefs.setString('subjectsList', json.encode(subjectsData));

        setState(() {
          subjectList = (subjectsData as List<dynamic>)
              .map((subject) =>
                  Subject.fromJson(subject as Map<String, dynamic>))
              .toList();
        });
        print('Subjects successfully fetched and stored');
      } else {
        print('Failed to fetch subjects: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      print('Error fetching subjects: $e\n$stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreenContent(fullName: fullName, subjects: subjectList),
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QueryScreen()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        tooltip: 'Ask a Question',
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  final String fullName;
  final List<Subject> subjects;

  const HomeScreenContent(
      {super.key, required this.fullName, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(
          children: [
            // Animated Story Icon
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StoryScreen()),
                  );
                },
                child: ShimmerIcon()),
            // Title
            Text(
              "Studex",
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
                // letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, size: 28),
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  fullName[0].toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 0.5,
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withAlpha(50))),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, $fullName!',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Explore your subjects and ask questions!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withAlpha(150),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.school,
                        color: Theme.of(context).colorScheme.primary, size: 40),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              HomeSection(),
              const SizedBox(height: 40),
              RecentQuestions(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
