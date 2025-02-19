import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': '🚫 Challenge Declined',
      'message':
          '😔 Abinash Das has declined your challenge. Try challenging someone else! 💪',
      'timestamp': DateTime.now().subtract(Duration(minutes: 1)),
      'image': 'assets/avatars/avatar1.png', // Use a dummy image path
      'read': false, // Added read field
    },
    {
      'title': '📝 New Exam Assigned!',
      'message':
          '📚 Your exam on Human Reproduction is now live! Start preparing! 🌟',
      'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
      'image': 'assets/avatars/avatar2.png',
      'read': true, // Added read field
    },
    {
      'title': '🏆 New Challenge!',
      'message':
          '🎮 Abinash Das has challenged you to a quiz! Are you ready to compete?',
      'timestamp': DateTime.now().subtract(Duration(minutes: 15)),
      'image': 'assets/avatars/avatar3.png',
      'read': false,
    },
    {
      'title': '🎉 Challenge Accepted!',
      'message':
          '🚀 Your challenge against Abinash has been accepted! Time to show your skills!',
      'timestamp': DateTime.now().subtract(Duration(hours: 1)),
      'image': 'assets/avatars/avatar4.png',
      'read': true,
    },
    {
      'title': '🚫 Challenge Declined',
      'message':
          '😔 Abinash Das has declined your challenge. Try challenging someone else! 💪',
      'timestamp': DateTime.now().subtract(Duration(minutes: 1)),
      'image': 'assets/avatars/avatar1.png', // Use a dummy image path
      'read': true,
    },
    {
      'title': '📝 New Exam Assigned!',
      'message':
          '📚 Your exam on Human Reproduction is now live! Start preparing! 🌟',
      'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
      'image': 'assets/avatars/avatar2.png',
      'read': false,
    },
    {
      'title': '🏆 New Challenge!',
      'message':
          '🎮 Abinash Das has challenged you to a quiz! Are you ready to compete?',
      'timestamp': DateTime.now().subtract(Duration(minutes: 15)),
      'image': 'assets/avatars/avatar3.png',
      'read': true,
    },
    {
      'title': '🎉 Challenge Accepted!',
      'message':
          '🚀 Your challenge against Abinash has been accepted! Time to show your skills!',
      'timestamp': DateTime.now().subtract(Duration(hours: 1)),
      'image': 'assets/avatars/avatar4.png',
      'read': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Subjects",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          backgroundColor: AppColors.foreground,
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'read_all') {
                  print('Read all notifications');
                } else if (value == 'delete_all') {
                  print('Delete all notifications');
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'read_all',
                    child: ListTile(
                      leading:
                          Icon(Icons.mark_email_read, color: Colors.white54),
                      title: Text("Read All"),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete_all',
                    child: ListTile(
                      leading: Icon(Icons.delete, color: Colors.white54),
                      title: Text("Delete All"),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: notification['read']
                    ? AppColors.foreground
                    : Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                        notification['image'] ?? 'assets/avatars/default.png'),
                  ),
                  title: Text(
                    notification['title'] ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  subtitle: Text(
                    notification['message'] ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        timeago.format(notification['timestamp']),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  onTap: () {
                    // Handle notification tap
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tapped on notification')));
                  },
                ),
              );
            },
          ),
        ));
  }
}
