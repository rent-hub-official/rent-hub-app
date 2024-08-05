import 'dart:developer';

import 'package:rent_hub/features/notification/service/notification_service.dart';

class GetFcmTokenFromMessagingUseCase {
  Future<String?> call({required String? currentUser}) async {
    try {
      final fcmToken =
          await NotificationService().getFcmTokenFromMessaging(currentUser);

      log('Getting FCM token in use case $fcmToken');

      return fcmToken;
    } catch (e) {
      throw Exception('Error getting FCM token');
    }
  }
}
