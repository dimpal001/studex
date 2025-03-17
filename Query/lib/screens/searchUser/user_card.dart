import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/searchUser/userScreen/user_screen.dart';

class UserCard extends StatelessWidget {
  final Map<String, dynamic> user;
  final String status;

  const UserCard({Key? key, required this.user, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfileScreen(
                  userName: user['fullName'],
                  userEmail:
                      "${user['fullName'].toLowerCase().replaceAll(' ', '')}@example.com",
                  profileImage:
                      user['profileUrl'] ?? "https://via.placeholder.com/150",
                  bio: user['bio'] ?? 'No bio available',
                  followers: 1200,
                  following: 500,
                  posts: 25,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: user['profileUrl'] != null
                      ? NetworkImage(user['profileUrl'])
                      : null,
                  child: user['profileUrl'] == null
                      ? Text(
                          user['fullName'][0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user['fullName'],
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        user['class']['name'],
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(170),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            "1.2K Followers",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withAlpha(150),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withAlpha(30),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "75% Progress",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _buildStatusButton(context, status),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusButton(BuildContext context, String status) {
    switch (status) {
      case 'Friend':
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: const Text('Friend', style: TextStyle(color: Colors.white)),
        );
      case 'Requested':
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          child: Text('Following',
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        );
      case 'Accept':
        return ElevatedButton(
          onPressed: () {}, // Add accept logic
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: const Text('Accept', style: TextStyle(color: Colors.white)),
        );
      case 'Follow':
      default:
        return ElevatedButton(
          onPressed: () {}, // Add follow logic
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          child: Text('Follow',
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        );
    }
  }
}
