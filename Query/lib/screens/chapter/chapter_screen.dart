import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/chapter/chapter_section.dart';
import 'package:my_flutter_app/screens/chapter/question_section.dart';

class ChapterScreen extends StatefulWidget {
  final String subjectId;
  final String subjectName;

  const ChapterScreen({
    super.key,
    required this.subjectId,
    required this.subjectName,
  });

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          widget.subjectName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              "Progress 75%",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Tab Buttons
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
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
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).colorScheme.surfaceContainer
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isActive
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onPrimary.withAlpha(50),
              width: isActive ? 2 : 1,
            ),
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
