import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/chat/domain/usecase/format_time/format_time_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'format_time_controller.g.dart';

@riverpod
String formatTime(FormatTimeRef ref,{required Timestamp timestamp}) {
  return FormatTimeUseCase()(timestamp: timestamp);
}
