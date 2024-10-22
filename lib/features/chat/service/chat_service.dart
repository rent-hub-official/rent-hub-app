import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';
import 'package:rent_hub/features/chat/domain/model/message_model.dart';

class ChatService {
  static final messageCollection =
      FirebaseFirestore.instance.collection('message').withConverter(
            fromFirestore: MessageModel.fromFirestore,
            toFirestore: MessageModel.toFirestore,
          );
  static Future<String?> uploadAttachment(File attachment) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('attachments/${DateTime.now().millisecondsSinceEpoch}');
      final uploadTask = storageRef.putFile(attachment);
      final snapshot = await uploadTask.whenComplete(() => null);
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  static Future<void> sendMessage(
      MessageModel message, File? attachment) async {
    try {
      String? downloadUrl;
      if (attachment != null) {
        downloadUrl = await uploadAttachment(attachment);
        message = message.copyWith(attachment: downloadUrl);
      }

      await ChatService.messageCollection.doc().set(message);
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  static Stream<QuerySnapshot<MessageModel>> allMessage() {
    return ChatService.messageCollection.orderBy("time").snapshots();
  }

  /// Get all messages of a current user with [userId]
  static Stream<QuerySnapshot<MessageModel>> getMessages(String userId) {
    try {
      final loggedInUserId = FirebaseAuth.instance.currentUser!.phoneNumber!;

      final messages = messageCollection
          .where(
            Filter.or(
              Filter.and(Filter('receiverId', isEqualTo: userId),
                  Filter('senderId', isEqualTo: loggedInUserId)),
              Filter.and(Filter('receiverId', isEqualTo: loggedInUserId),
                  Filter('senderId', isEqualTo: userId)),
            ),
          )
          .orderBy('time')
          .snapshots();

      return messages;
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  /// Get all messages of a current user
  static Future<QuerySnapshot<MessageModel>> getAllMessages() async {
    try {
      final loggedInUserId = FirebaseAuth.instance.currentUser!.phoneNumber!;

      final messages = await messageCollection
          .where(
            Filter.or(
              Filter('receiverId', isEqualTo: loggedInUserId),
              Filter('senderId', isEqualTo: loggedInUserId),
            ),
          )
          .get();

      return messages;
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  static Future<QuerySnapshot<AccountDetailsModel>> getUser(String userId) {
    return AccountDetailsService.db.where('userId', isEqualTo: userId).get();
  }
}
