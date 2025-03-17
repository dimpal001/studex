import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String userId;
  final String fullName;
  final String profileUrl;
  final String className;
  final bool isSelected;
  final VoidCallback onTap;

  const UserCard({
    Key? key,
    required this.userId,
    required this.fullName,
    required this.profileUrl,
    required this.className,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.05)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(fullName[0].toUpperCase()),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Class: IX',
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(170),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
