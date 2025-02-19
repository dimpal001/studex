import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/splash/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// Initialize Flutter Local Notifications
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  _showNotification(message);
}

void _showNotification(RemoteMessage message) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title ?? 'New Notification',
    message.notification?.body ?? 'You have a new message',
    platformChannelSpecifics,
  );
}

void _initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  // await Firebase.initializeApp();
  // _initializeNotifications();

  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  // // Request permission for notifications
  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print(
  //       "Foreground Message: ${message.notification?.title} - ${message.notification?.body}");
  //   _showNotification(message);
  // });

  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   print("Notification Clicked: ${message.notification?.title}");
  // });

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // messaging.getToken().then((token) {
  //   print("FCM Token: $token");
  // });

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode
          ? ThemeData.dark().copyWith(
              primaryColor: const Color(0xFFF0363F),
              scaffoldBackgroundColor: const Color(0xFF171720),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            )
          : ThemeData.light().copyWith(
              primaryColor: const Color(0xFFF0363F),
              scaffoldBackgroundColor: const Color(0xFFE0E0E0),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFFE0E0E0),
                foregroundColor: Colors.black87,
              ),
            ),
      // navigatorObservers: [
      //   FirebaseAnalyticsObserver(analytics: analytics),
      // ],
      home: SplashScreen(),
    );
  }
}
