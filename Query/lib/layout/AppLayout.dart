import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/home/home_screen.dart';
import 'package:my_flutter_app/screens/notification/notification_screen.dart';
import 'package:my_flutter_app/screens/profile/profile_screen.dart';

class AppLayout extends StatefulWidget {
  final Widget child;

  const AppLayout({super.key, required this.child});

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentIndex = 0;

  late final List<Widget> _screens = [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  bool _shouldShowBottomNavBar() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          if (_shouldShowBottomNavBar())
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  if (_currentIndex == index) {
                    return;
                  }

                  setState(() {
                    _currentIndex = index;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => _screens[index],
                    ),
                  );
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'Notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
