import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  final String message;
  final VoidCallback onReload;

  const ErrorComponent({
    Key? key,
    this.message = "Something went wrong!",
    required this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Color(0xFFF0363F), size: 50),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onReload,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF0363F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: Text(
                "Reload",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
