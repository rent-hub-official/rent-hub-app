import 'package:rent_hub/features/notification/domain/entity/notification_entity.dart';
import 'package:rent_hub/object_box_service.dart';

/// Adds a notification to the database
class NotificationAddUseCase {
  final db = ObjectBoxService.instance;

  void call({required String title, required String subTitle}) {
    db.notificationBox.put(
      NotificationEntity(title: title, subTitle: subTitle),
    );

    db.notificationBox.getAll();
  }
}
