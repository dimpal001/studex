import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/screens/query/query_screen.dart';

class ChapterSection extends StatefulWidget {
  final String subjectId;

  ChapterSection({required this.subjectId});

  @override
  _ChapterSectionState createState() => _ChapterSectionState();
}

class _ChapterSectionState extends State<ChapterSection> {
  final List<Map<String, dynamic>> chapters = [
    {"name": "Introduction to Physics", "questions": 10, "progress": 0.7},
    {"name": "Newton’s Laws", "questions": 8, "progress": 0.4},
    {"name": "Thermodynamics", "questions": 12, "progress": 0.9},
  ];

  final TextEditingController _chapterNameController = TextEditingController();

  void _openAddChapterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      backgroundColor: AppColors.foreground,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add New Chapter",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _chapterNameController,
                decoration: InputDecoration(
                  labelText: "Chapter Name",
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white38),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity, // Full-width button
                child: ElevatedButton(
                  onPressed: () {
                    String newChapterName = _chapterNameController.text.trim();
                    if (newChapterName.isNotEmpty) {
                      print(
                          "New Chapter: $newChapterName, Subject ID: ${widget.subjectId}");
                      Navigator.pop(context); // Close bottom sheet
                      _chapterNameController.clear(); // Clear text field
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Add Chapter",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 15, bottom: 80),
          itemCount: chapters.length,
          itemBuilder: (context, index) {
            return Card(
              color: AppColors.foreground,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  chapters[index]['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "${chapters[index]['questions']} Questions",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 5),
                    LinearProgressIndicator(
                      value: chapters[index]['progress'],
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation(AppColors.primary),
                    ),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70),
                onTap: () {
                  // Add chapter navigation
                },
              ),
            );
          },
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 10,
              children: [
                FloatingActionButton.extended(
                  backgroundColor: AppColors.foreground,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QueryScreen(),
                      ),
                    );
                  },
                  label: Icon(
                    Icons.question_answer,
                    color: AppColors.primary,
                  ),
                ),
                FloatingActionButton.extended(
                  backgroundColor: AppColors.primary,
                  onPressed: () => _openAddChapterSheet(context),
                  label: Row(
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 5),
                      Text("New Chapter",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  elevation: 6,
                ),
              ],
            )),
      ],
    );
  }
}
