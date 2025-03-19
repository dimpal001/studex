import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MaterialApp(home: StoryScreen()));
}

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  // Demo data for Stories
  final List<Map<String, dynamic>> stories = [
    {"imageUrl": "https://picsum.photos/seed/545/800", "duration": 4},
    {"imageUrl": "https://picsum.photos/seed/560/800", "duration": 4},
    {"imageUrl": "https://picsum.photos/seed/585/800", "duration": 4},
    {"imageUrl": "https://picsum.photos/seed/501/800", "duration": 4},
  ];

  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(
        Duration(seconds: stories[_currentIndex]["duration"]), (timer) {
      if (_currentIndex < stories.length - 1) {
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _timer?.cancel();
        Navigator.pop(context); // Close the screen after the last story
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          "Today's Special",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Progress Bars
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: List.generate(stories.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: LinearProgressIndicator(
                      value: _currentIndex == index ? null : 1.0,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _currentIndex == index ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          // Story Image
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: stories.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _startTimer();
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Image.network(
                    stories[index]["imageUrl"],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            ),
          ),
          // Try Now Button
          Padding(
              padding: const EdgeInsets.all(13.0),
              child: SizedBox(
                width: double.infinity, // Full width
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Try Now button pressed!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Try Now",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
