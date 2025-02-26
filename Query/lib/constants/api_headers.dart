import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, String>> getCustomHeaders({String? fcmToken}) async {
  final prefs = await SharedPreferences.getInstance();
  final authToken = prefs.getString('token');

  return {
    'Authorization': 'Bearer $authToken',
    'Content-Type': 'application/json',
    if (fcmToken != null) 'FCM-Token': fcmToken,
  };
}
