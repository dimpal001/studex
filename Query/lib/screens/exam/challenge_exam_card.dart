import 'package:flutter/material.dart';

class ChallengeExamCard extends StatelessWidget {
  final String title, subtitle, duration, questions, timeLeft;

  ChallengeExamCard({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.questions,
    required this.timeLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
        border: Border(
            left: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Challenge from Rahul",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          SizedBox(height: 4),
          Text(subtitle,
              style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withAlpha(120))),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.watch_later,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(120),
                          size: 15),
                      SizedBox(width: 5),
                      Text("$duration",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withAlpha(120))),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.help_outline,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(120),
                          size: 15),
                      SizedBox(width: 5),
                      Text("$questions",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withAlpha(120))),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary),
                onPressed: () {},
                child: Text("Start Now", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
