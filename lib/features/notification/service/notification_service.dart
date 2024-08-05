// fin  al fcmToken = await FirebaseMessaging.instance.getToken();

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getFcmTokenFromMessaging(String? currentUser) async {
    try {
      if (currentUser != null) {
        final fcmToken = await _firebaseMessaging.getToken();
        log('fcmToken in service: $fcmToken');
        return fcmToken;
      }

      // log('fcmToken in service: $fcmToken');
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
