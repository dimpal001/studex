// lib/screens/welcome_screen.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'
    as carousel; // Added alias
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentIndex = 0;
  final carousel.CarouselController _carouselController =
      carousel.CarouselController();

  final List<Map<String, dynamic>> onboardingSteps = [
    {
      'title': 'Welcome to Your Virtual Study Table',
      'description': 'Personalized learning at your fingertips',
      'image': 'assets/images/welcome1.png',
    },
    {
      'title': 'Customize Your Learning',
      'description': 'Choose your class, subjects, and preferred language',
      'image': 'assets/images/welcome2.png',
    },
    {
      'title': 'Ask Anything',
      'description': 'Get instant answers powered by advanced AI',
      'image': 'assets/images/welcome3.png',
    },
    {
      'title': 'Study Smarter',
      'description': 'Your personal educational companion',
      'image': 'assets/images/welcome4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: carousel.CarouselSlider.builder(
                // Used alias
                carouselController: _carouselController,
                itemCount: onboardingSteps.length,
                itemBuilder: (context, index, realIndex) {
                  return _buildOnboardingCard(
                    onboardingSteps[index]['title'],
                    onboardingSteps[index]['description'],
                    onboardingSteps[index]['image'],
                  );
                },
                options: carousel.CarouselOptions(
                  // Used alias
                  height: double.infinity,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: onboardingSteps.length,
                    effect: WormEffect(
                      dotWidth: 12,
                      dotHeight: 12,
                      activeDotColor: AppColors.primary,
                      dotColor: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.foreground,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingCard(
      String title, String description, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
