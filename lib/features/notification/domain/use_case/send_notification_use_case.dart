import 'package:rent_hub/features/notification/domain/model/send_notification_model/send_notification_model.dart';
import 'package:rent_hub/features/notification/service/push_notification.dart';

class SendNotificationUseCase {
  Future<String> call({
    required SendNotificationModel sendNotificationModel,
    required String fcmToken,
  }) async {
    return await PushNotificationService().sendNotification(
      sendNotificationModel: sendNotificationModel,
      fcmToken: fcmToken,
    );
  }
}
