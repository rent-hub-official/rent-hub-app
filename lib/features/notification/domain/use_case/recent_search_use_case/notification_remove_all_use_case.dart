import 'package:rent_hub/object_box_service.dart';

/// Removes all notifications from the database
class NotificationRemoveAllUseCase {
  final db = ObjectBoxService.instance;

  void call() {
    db.notificationBox.removeAll();
  }
}
