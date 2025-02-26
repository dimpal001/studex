import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/screens/exam/exam_screen.dart';
import 'package:my_flutter_app/screens/home/home_screen.dart';
import 'package:my_flutter_app/screens/query/query_screen.dart';
import 'package:my_flutter_app/screens/searchUser/search_user_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const BottomNavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onItemTapped(int index) {
    if (index == widget.selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => QueryScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ExamScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SearchUsersScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: AppColors.foreground,
        border: Border(
          top: BorderSide(
            color: Colors.white38,
            width: 1.0,
          ),
        ),
      ),
      child: ClipRRect(
        child: new BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: AppColors.foreground,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.question_answer,
                size: 25,
              ),
              label: 'Query',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                size: 25,
              ),
              label: 'Exams',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt_outlined,
                size: 25,
              ),
              label: 'Mates',
            ),
          ],
        ),
      ),
    );
  }
}
