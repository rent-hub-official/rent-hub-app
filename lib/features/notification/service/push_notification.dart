import 'package:dio/dio.dart';
import 'package:rent_hub/features/notification/domain/model/send_notification_model/send_notification_model.dart';

class PushNotificationService {
  Dio dio = Dio();

  Future<String> sendNotification({
    required SendNotificationModel sendNotificationModel,
    required String fcmToken,
  }) async {
    try {
      final Response response = await dio.request(
        'https://send-notification-e7vgjcma2q-uc.a.run.app',
        options: Options(
          method: 'POST',
          headers: {'Content-Type': 'application/json'},
        ),
        queryParameters: {
          "token": fcmToken,
        },
        data: {
          "title": sendNotificationModel.title,
          "body": sendNotificationModel.body,
          "payload": sendNotificationModel.payload?.toJson(),
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to send notification');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
