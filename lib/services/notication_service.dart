import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings("baby");

  void initialNotification() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String message) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max, priority: Priority.max);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, title, message, notificationDetails);
  }
}
