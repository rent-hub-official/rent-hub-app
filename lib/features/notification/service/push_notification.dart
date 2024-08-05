import 'package:dio/dio.dart';
import 'package:rent_hub/features/notification/domain/model/send_notification_model/send_notification_model.dart';

class PushNotificationService {
  Dio dio = Dio();

  Future<SendNotificationModel> sendNotification({
    required SendNotificationModel sendNotificationModel,
    required String fcmToken,
  }) async {
    try {
      final Response response = await dio.request(
        'https://send-notification-e7vgjcma2q-uc.a.run.app?token=cmvuPhVORxCBph-9ceCy8w:APA91bE-kat1JzIvPT5Q-2SjODwEjLhrkegXocM1fKMY2H4pkwUYODEgVTElXQoULmrMNYhOGQXmCEc7W84nAEy4ZF6GyuA9NZb6KChvrv7Q4PKedZtrv3D3WSE4jRQHS-S8MObsgM-9',
        options: Options(
          method: 'POST',
          headers: {'Content-Type': 'application/json'},
        ),
        data: {
          "title": sendNotificationModel.title,
          "body": sendNotificationModel.body,
          "token": fcmToken,
          "payload": sendNotificationModel.payload?.toJson(),
        },
      );

      if (response.statusCode == 200) {
        return SendNotificationModel.fromJson(response.data);
      } else {
        throw Exception('Failed to send notification');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
