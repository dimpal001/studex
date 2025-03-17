import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 5,
      margin: const EdgeInsets.only(top: 5, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
