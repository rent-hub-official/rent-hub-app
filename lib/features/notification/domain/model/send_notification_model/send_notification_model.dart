import 'package:freezed_annotation/freezed_annotation.dart';

import 'payload.dart';

part 'send_notification_model.freezed.dart';
part 'send_notification_model.g.dart';

@freezed
class SendNotificationModel with _$SendNotificationModel {
  factory SendNotificationModel({
    String? title,
    String? body,
    Payload? payload,
  }) = _SendNotificationModel;

  factory SendNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$SendNotificationModelFromJson(json);
}
