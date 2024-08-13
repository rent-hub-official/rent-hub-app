import 'package:rent_hub/object_box_service.dart';

/// Removes a notification from the database
class NotificationRemoveUseCase {
  final db = ObjectBoxService.instance;

  void call({required int id}) {
    db.notificationBox.remove(id);
  }
}
