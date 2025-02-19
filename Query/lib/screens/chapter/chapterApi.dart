import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';

class ChapterApi {
  static Future getChapters(String subjectId) {
    return http.get(Uri.parse("$baseUrl/chapter/all?subjectId=$subjectId"));
  }
}
