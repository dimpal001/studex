import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/api_headers.dart';
import 'package:my_flutter_app/constants/skeleton_loader.dart';
import 'dart:convert';
import 'package:my_flutter_app/constants/user_card.dart';
import 'package:my_flutter_app/screens/exam/startExam/start_exam_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UpcomingExamCard extends StatefulWidget {
  @override
  _UpcomingExamCardState createState() => _UpcomingExamCardState();
}

class _UpcomingExamCardState extends State<UpcomingExamCard> {
  late Future<List<dynamic>> _examsFuture;

  @override
  void initState() {
    super.initState();
    _examsFuture = fetchExams();
  }

  Future<List<dynamic>> fetchExams() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final headers = await getCustomHeaders();
    final url = Uri.parse('$baseUrl/exam/get-upcoming-exams?userId=$userId');

    try {
      final response = await http.get(url, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        return data['exams'];
      } else {
        throw Exception('Failed to load exams');
      }
    } catch (e) {
      print(e);
      throw Exception('Error fetching exams: $e');
    }
  }

  String _calculateDaysLeft(String createdAt) {
    final createdDate = DateTime.parse(createdAt);
    final currentDate = DateTime.now();
    final difference = currentDate.difference(createdDate).inDays;
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 30) {
      return '$difference days ago';
    } else if (difference < 365) {
      int months = (difference / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      int years = (difference / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  void _openShareBottomDrawer(BuildContext context, String examId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ShareExamBottomDrawer(examId: examId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: _examsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show skeleton loader while waiting for data
            return SkeletonLoader(padding: EdgeInsets.all(0));
          } else if (snapshot.hasError) {
            // Show error message if data fetch fails
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Show message if no exams are available
            return Center(
              child: Text(
                "No exams available.",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
                ),
              ),
            );
          }

          // Render the list of exams when data is available
          final exams = snapshot.data!;
          return ListView.builder(
            itemCount: exams.length,
            itemBuilder: (context, index) {
              final exam = exams[index];
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          exam['name'],
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(180),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Text(
                          _calculateDaysLeft(exam['createdAt']),
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(120),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${exam["subject"]} • ${exam["topic"]}",
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withAlpha(120),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.watch_later,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withAlpha(120),
                                    size: 15),
                                SizedBox(width: 5),
                                Text(
                                  '${exam['duration']} min',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withAlpha(120),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.help_outline,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withAlpha(120),
                                    size: 15),
                                SizedBox(width: 5),
                                Text(
                                  '${exam['noOfQuestions']} Questions',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withAlpha(120),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                                side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StartExamScreen(
                                      examId: exam["id"],
                                    ),
                                  ),
                                ).then((result) {
                                  if (result != null) {
                                    print("Exam completed: $result");
                                  }
                                });
                              },
                              child: Text(
                                "Start Now",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            IconButton(
                              icon: Icon(Icons.share,
                                  color: Theme.of(context).colorScheme.primary),
                              onPressed: () {
                                _openShareBottomDrawer(context, exam["id"]);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ShareExamBottomDrawer extends StatefulWidget {
  final String examId;

  const ShareExamBottomDrawer({Key? key, required this.examId})
      : super(key: key);

  @override
  _ShareExamBottomDrawerState createState() => _ShareExamBottomDrawerState();
}

class _ShareExamBottomDrawerState extends State<ShareExamBottomDrawer> {
  final List<Map<String, dynamic>> users = [];
  final Set<String> selectedUsers = {};
  bool hasMore = true;
  int page = 1;
  bool isLoading = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _fetchUsers();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchUsers() async {
    if (isLoading || !hasMore) return;

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    setState(() {
      isLoading = true;
    });

    final headers = await getCustomHeaders();
    final url =
        Uri.parse('$baseUrl/user/get-friends?userId=$userId&page=$page');

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        final List<dynamic> fetchedUsers = data['resData'];
        final bool hasMoreData = data['hasMore'] ?? false;
        setState(() {
          users.addAll(fetchedUsers.map((user) => {
                "id": user["id"],
                "fullName": user["fullName"] ?? "Unknown",
                "className":
                    user["class"] != null ? user["class"]["name"] : "No Class",
                "profileUrl": user["profileUrl"] ?? "",
              }));
          isLoading = false;
          hasMore = hasMoreData;
          page++;
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching users: $e")),
      );
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchUsers();
    }
  }

  void _shareExam() {
    if (selectedUsers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select at least one user to share.")),
      );
      return;
    }
    print("Sharing exam ${widget.examId} with users: $selectedUsers");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Share Exam",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: users.length + (hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < users.length) {
                  final user = users[index];
                  final isSelected = selectedUsers.contains(user["id"]);
                  return UserCard(
                    userId: user["id"],
                    fullName: user["fullName"],
                    className: user["className"],
                    profileUrl: user["profileUrl"],
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedUsers.remove(user["id"]);
                        } else {
                          selectedUsers.add(user["id"]);
                        }
                      });
                    },
                  );
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: selectedUsers.isNotEmpty ? _shareExam : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedUsers.isNotEmpty
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Share Exam',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
