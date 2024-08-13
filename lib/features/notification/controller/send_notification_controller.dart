import 'package:rent_hub/features/notification/domain/model/send_notification_model/send_notification_model.dart';
import 'package:rent_hub/features/notification/domain/use_case/send_notification_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_notification_controller.g.dart';

@riverpod
class SendNotificationController extends _$SendNotificationController {
  @override
  bool build() {
    return false;
  }

  Future<void> sendNotification({
    required SendNotificationModel sendNotification,
    required String fcmToken,
  }) async {
    await SendNotificationUseCase()(
      sendNotificationModel: sendNotification,
      fcmToken: fcmToken,
    );
  }
}
