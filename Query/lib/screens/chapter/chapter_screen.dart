import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/screens/chapter/chapter_section.dart';
import 'package:my_flutter_app/screens/chapter/question_section.dart';

class ChapterScreen extends StatefulWidget {
  final String subjectId;
  final String subjectName;

  const ChapterScreen({
    Key? key,
    required this.subjectId,
    required this.subjectName,
  }) : super(key: key);

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen>
    with SingleTickerProviderStateMixin {
  bool showChapters = true;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    // Only start the animation after everything is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          widget.subjectName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: AppColors.foreground,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Buttons
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.foreground,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              spacing: 12,
              children: [
                _buildTabButton("Chapters", showChapters, () {
                  setState(() {
                    showChapters = true;
                    _animationController.reset();
                    _animationController.forward();
                  });
                }),
                _buildTabButton("Questions", !showChapters, () {
                  setState(() {
                    showChapters = false;
                    _animationController.reset();
                    _animationController.forward();
                  });
                }),
              ],
            ),
          ),

          // Content Section
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: showChapters
                  ? ChapterSection(
                      subjectId: widget.subjectId,
                    )
                  : QuestionSection(
                      subjectId: widget.subjectId,
                      subjectName: widget.subjectName,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, bool isActive, VoidCallback onTap) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.background,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
