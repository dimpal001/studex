import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';

Future<void> createExam({
  required String examName,
  required String subject,
  required String topic,
  required String duration,
  required int numberOfQuestions,
}) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/exam/create-exam'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer YOUR_AUTH_TOKEN',
      },
      body: jsonEncode({
        'name': examName,
        'subject': subject,
        'topic': topic,
        'duration': duration,
        'questions': numberOfQuestions,
      }),
    );

    if (response.statusCode == 201) {
      print("Exam created successfully: ${response.body}");
    } else {
      print("Failed to create exam: ${response.body}");
    }
  } catch (error) {
    print("Error creating exam: $error");
  }
}
