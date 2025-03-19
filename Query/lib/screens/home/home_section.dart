import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/query/query_screen.dart';
import 'package:my_flutter_app/screens/subject/subject_screen.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCard(context, Icons.question_answer, 'Ask', QueryScreen()),
          _buildCard(context, Icons.book, 'Subjects', SubjectScreen()),
          _buildCard(context, Icons.school, 'Exams', ExamsScreen()),
          _buildCard(
              context, Icons.emoji_events, 'Challenges', ChallengesScreen()),
        ],
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, IconData icon, String label, Widget screen) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 37,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class ExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exams")),
      body: Center(child: Text("Exams Screen")),
    );
  }
}

class ChallengesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Challenges")),
      body: Center(child: Text("Challenges Screen")),
    );
  }
}
