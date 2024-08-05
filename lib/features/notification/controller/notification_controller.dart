import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/main.dart';

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    final payload = receivedAction.payload;

    if (payload == null || !payload.containsKey('routerPath')) {
      return;
    }

    final routerPath = payload['routerPath'];
    final routerState = jsonDecode(payload['routerState'] ?? "");

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    MyApp.navigatorKey.currentContext!.push(
      routerPath!,
      extra: routerState,
    );
  }

  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    _fcmHandler(message);
  }

  static Future<void> fcmForegroundHandler(RemoteMessage message) async {
    _fcmHandler(message);
  }

  static Future<void> _fcmHandler(RemoteMessage message) async {
    final notificationTitle = message.data['title'];
    final notificationBody = message.data['body'];

    log(notificationTitle + " " + notificationBody);

    final payload =
        message.data.containsKey('payload') ? message.data['payload'] : "{}";

    final payloadMap =
        (jsonDecode(payload) as Map<String, dynamic>).map((key, value) {
      final String outputValue;

      if (value is String) {
        outputValue = value;
      } else {
        outputValue = jsonEncode(value);
      }

      return MapEntry<String, String?>(
        key,
        outputValue,
      );
    });

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'renthub_channel',
        title: notificationTitle,
        body: notificationBody,
        payload: payloadMap,
      ),
    );
  }
}
