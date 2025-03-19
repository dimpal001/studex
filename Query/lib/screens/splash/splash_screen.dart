import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_flutter_app/screens/home/home_screen.dart';
import 'package:my_flutter_app/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    checkLoginStatus();
  }

  @override
  void dispose() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
    _controller.dispose();
    super.dispose();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    await Future.delayed(const Duration(seconds: 1));

    if (token != null && token.isNotEmpty) {
      try {
        bool isTokenExpired = JwtDecoder.isExpired(token);

        if (!isTokenExpired) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          return;
        } else {
          prefs.remove('token');
          prefs.remove('user');
        }
      } catch (e) {
        print("Error decoding token: $e");
      }
    }

    // Token is invalid or expired, navigate to LoginScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              padding: const EdgeInsets.all(20),
              child: Icon(
                Icons.school,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            // App title
            Text(
              'AskMe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Subtitle
            Text(
              'Your Learning Companion',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            // Animated dots
            if (_controller.isAnimating)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _getOpacity(index),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
          ],
        ),
      ),
    );
  }

  // Function to determine opacity for each dot
  double _getOpacity(int index) {
    final progress = _controller.value;
    if (index == 0) {
      return progress < 0.33
          ? 1
          : progress < 0.66
              ? 0.5
              : 0.2;
    } else if (index == 1) {
      return progress < 0.33
          ? 0.5
          : progress < 0.66
              ? 1
              : 0.5;
    } else {
      return progress < 0.33
          ? 0.2
          : progress < 0.66
              ? 0.5
              : 1;
    }
  }
}
