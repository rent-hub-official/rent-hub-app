import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notification_page_constants.g.dart';

class NotificationPageConstants {
  final  txtHeading = "Notification";
  final txtSubHeading = 'Today';
  
}

@riverpod
NotificationPageConstants notificationPageConstants(NotificationPageConstantsRef ref) {
  return NotificationPageConstants();
}
