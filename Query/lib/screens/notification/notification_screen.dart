import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [
    {
      'title': '🚫 Challenge Declined',
      'message':
          '😔 Abinash Das has declined your challenge. Try challenging someone else! 💪',
      'timestamp': DateTime.now().subtract(Duration(minutes: 1)),
      'image': 'assets/avatars/avatar1.png',
      'read': false,
    },
    {
      'title': '📝 New Exam Assigned!',
      'message':
          '📚 Your exam on Human Reproduction is now live! Start preparing! 🌟',
      'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
      'image': 'assets/avatars/avatar2.png',
      'read': true,
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
      'image': 'assets/avatars/avatar1.png',
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

  int get unreadCount => notifications.where((n) => !n['read']).length;

  void markAsRead(int index) {
    setState(() {
      notifications[index]['read'] = true;
    });
  }

  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification['read'] = true;
      }
    });
  }

  void deleteAll() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'read_all') {
                markAllAsRead();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('All notifications marked as read')),
                );
              } else if (value == 'delete_all') {
                deleteAll();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All notifications deleted')),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'read_all',
                  child: ListTile(
                    leading: const Icon(Icons.mark_email_read,
                        color: Colors.white70),
                    title: const Text("Mark All as Read",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete_all',
                  child: ListTile(
                    leading: const Icon(Icons.delete, color: Colors.white70),
                    title: const Text("Delete All",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert, color: Colors.white70),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            // Header with Unread Count
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainer
                    .withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your Notifications',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: unreadCount > 0
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '$unreadCount Unread',
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: notifications.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.notifications_off,
                              size: 60, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'No Notifications Yet',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return Dismissible(
                          key: Key(notification['timestamp'].toString()),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              notifications.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Notification dismissed')),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            color: notification['read']
                                ? Theme.of(context)
                                    .colorScheme
                                    .surfaceContainer
                                    .withOpacity(0.9)
                                : Theme.of(context)
                                    .colorScheme
                                    .surfaceContainer
                                    .withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage(
                                  notification['image'] ??
                                      'assets/avatars/default.png',
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              title: Text(
                                notification['title'] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: notification['read']
                                      ? Colors.white70
                                      : Colors.white,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  notification['message'] ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: notification['read']
                                        ? Colors.white54
                                        : Colors.white70,
                                  ),
                                ),
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    timeago.format(notification['timestamp']),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: notification['read']
                                          ? Colors.grey
                                          : Theme.of(context)
                                              .colorScheme
                                              .primary,
                                    ),
                                  ),
                                  if (!notification['read'])
                                    GestureDetector(
                                      onTap: () => markAsRead(index),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 4),
                                        child: Icon(Icons.mark_email_read,
                                            size: 18,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
                                    ),
                                ],
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Tapped: ${notification['title']}')),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
