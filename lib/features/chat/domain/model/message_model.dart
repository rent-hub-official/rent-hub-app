import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String senderId,
    required String receiverId,
    String? message,
    required bool isRead,
    required bool isReceived,
    String? attachment,
    required Timestamp time,
  }) = _MessageModel;

  factory MessageModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return MessageModel(
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      message: data['message'],
      isRead: data['isRead'],
      isReceived: data['isReceived'],
      attachment: data['attachment'],
      time: data['time'],
    );
  }

  static Map<String, dynamic> toFirestore(
    MessageModel messageModel, [
    SetOptions? options,
  ]) {
    return {
      'senderId': messageModel.senderId,
      'receiverId': messageModel.receiverId,
      'message': messageModel.message,
      'isRead': messageModel.isRead,
      'isReceived': messageModel.isReceived,
      'attachment': messageModel.attachment,
      'time': messageModel.time,
    };
  }
}
