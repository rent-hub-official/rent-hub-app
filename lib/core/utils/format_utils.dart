import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FormatUtils {
  static String formatLastSeen(Timestamp timestamp) {
    final lastSeenTime = timestamp.toDate();

    final currentTime = DateTime.now();
    final currentDate =
        DateTime(currentTime.year, currentTime.month, currentTime.day);
    final lastSeenDate =
        DateTime(lastSeenTime.year, lastSeenTime.month, lastSeenTime.day);
    final diffInDays = currentDate.difference(lastSeenDate).inDays;

    if (diffInDays < 1) {
      return 'Last seen at ${DateFormat('h:m a').format(lastSeenTime)}';
    } else if (diffInDays == 1) {
      return 'Last seen yesterday';
    } else {
      return 'Last seen on ${DateFormat('d/M/y').format(lastSeenTime)}';
    }
  }
}
