import 'package:flutter/material.dart';

class DummyScreen extends StatefulWidget {
  @override
  _DummyScreenState createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  final List<Map<String, String>> dummyProjects = [
    {"title": "Guess a Number Program", "downloads": "2.3K Downloads"},
    {"title": "Predict a Fruit Program", "downloads": "2.3K Downloads"},
    {"title": "Classify Iris Flowers", "downloads": "2.3K Downloads"},
    {"title": "Predict Global Temperature", "downloads": "2.3K Downloads"},
    {"title": "Simple Stock Prediction", "downloads": "2.3K Downloads"},
    {"title": "Basic Sentiment Analysis", "downloads": "2.3K Downloads"},
    {"title": "Diabetic Prediction", "downloads": "2.3K Downloads"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF08081E), // Dark background color
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Artificial Intelligence",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: const Color(0xFF2E2E5C),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 10),
        ],
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF2E2E5C),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Custom Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab("Learn", isSelected: false),
                _buildTab("Projects", isSelected: true),
                _buildTab("Q&A", isSelected: false),
                _buildTab("Best AI Tools", isSelected: false),
              ],
            ),
            const SizedBox(height: 16),
            // Project Cards
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: dummyProjects.length,
                itemBuilder: (context, index) {
                  final project = dummyProjects[index];
                  return _buildProjectCard(
                    title: project["title"]!,
                    downloads: project["downloads"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.purple : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white70,
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildProjectCard({required String title, required String downloads}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF222252),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.arrow_outward_rounded,
              size: 28,
              color: Colors.purpleAccent,
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              downloads,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
