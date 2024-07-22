import 'package:cloud_firestore/cloud_firestore.dart';

class FormatTimeUseCase {
  String call({required Timestamp timestamp}) {
    DateTime dateTime = timestamp.toDate();
    int hour = dateTime.hour;
    int minute = dateTime.minute;

    String period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    hour = hour != 0 ? hour : 12; // Convert '0' hour to '12'

    String minuteString = minute < 10 ? '0$minute' : minute.toString();

    return '$hour:$minuteString $period';
  }
}
