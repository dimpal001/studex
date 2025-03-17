import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/bottom_nav_bar.dart';
import 'package:my_flutter_app/screens/home/recent_questions.dart';
import 'package:my_flutter_app/screens/notification/notification_screen.dart';
import 'package:my_flutter_app/screens/profile/profile_screen.dart';
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Colors.white),
        tooltip: 'Ask a Question',
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  final String fullName;
  final List<Subject> subjects;

  const HomeScreenContent({required this.fullName, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Studex",
          style: TextStyle(
            fontSize: 30,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, size: 28),
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
            },
          ),
          Padding(
              padding: const EdgeInsets.only(right: 12, left: 8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    fullName[0].toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome, $fullName!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Explore your subjects and ask questions!',
                              style: TextStyle(
                                fontSize: 14,
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
                          color: Theme.of(context).colorScheme.primary,
                          size: 40),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Search Bar
                GestureDetector(
                  onTap: () => print('Search tapped'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(100)),
                        SizedBox(width: 12),
                        Text(
                          'Search question...',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withAlpha(100),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Quick Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuickActionCard(
                      context,
                      title: 'Ask Question',
                      icon: Icons.question_answer,
                      route: QueryScreen(),
                      color:
                          Theme.of(context).colorScheme.onPrimary.withAlpha(20),
                    ),
                    _buildQuickActionCard(
                      context,
                      title: 'My Subjects',
                      icon: Icons.menu_book,
                      route: SubjectScreen(),
                      color:
                          Theme.of(context).colorScheme.onPrimary.withAlpha(30),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Recent Questions
                Text(
                  'Recent Questions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                RecentQuestions(),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget route,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color,
                child: Icon(icon,
                    color: Theme.of(context).colorScheme.primary, size: 28),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
