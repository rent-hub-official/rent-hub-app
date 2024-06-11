import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';
import 'package:rent_hub/features/chat/domain/model/message_model.dart';
import 'package:rent_hub/features/chat/service/chat_service.dart';

class ChatUseCase {

  // Function to send a message
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
      throw StorageException(error: e.message);
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
      throw StorageException(error: e.message);
    }
  }

  static Stream<QuerySnapshot<MessageModel>> messageSentByMe() {
    return ChatService.messageCollection.orderBy("time").snapshots();
  }

  static Stream<QuerySnapshot<AccountDetailsModel>> getUser() {
    return AccountDetailsService.firebaseFirestoreInstance
        .withConverter(
          fromFirestore: AccountDetailsModel.fromFirestore,
          toFirestore: AccountDetailsModel.toFirestore,
        )
        .snapshots();
  }

//  static Stream<QuerySnapshot<Map<String, dynamic>> >dbdataget() {
//     try {
//       return AccountDetailsService.firebaseFirestoreInstance.snapshots();
//     } on FirebaseException catch (e) {
//       throw StorageException(error: e.message);
//     }
//   }

}
