// import 'dart:developer';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
// import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
// import 'package:rent_hub/features/chat/domain/model/message_model.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'chat_controller.g.dart';

// @riverpod
// class ChatController extends _$ChatController {
 

//   Future<String?> uploadAttachment(File file, BuildContext context) async {
//     try {
//       return await ChatUseCase.uploadAttachment(file);
//     } on StorageException catch (e) {
//       Future.sync(
//         () => ErrorSnackBar(context, errorMessage: e.message),
//       );
//       throw StorageException(message: e.message);
//     }
//   }

//   Future<void> sendMessage({
//     required MessageModel message,
//     required BuildContext context,
//     File? attachment,
//   }) {
//     try {
//       return ChatUseCase.sendMessage(message, attachment);
//     } on StorageException catch (e) {
//       Future.sync(
//         () => ErrorSnackBar(context, errorMessage: e.message),
//       );
//       throw BaseException(message: e.message);
//     }
//   }
// }

// @riverpod
// Stream<List<MessageModel>> messageSentByme(MessageSentBymeRef ref) async* {
//   final data = await ChatUseCase.messageSentByMe();

//   await for (var event in data) {
//     var allMessage = <MessageModel>[];

//     for (var model in event.docs) {
//       allMessage.add(model.data());
//     }
//     yield allMessage;
//   }
// }

// @riverpod
// Stream<QuerySnapshot<AccountDetailsModel>> getUser(GetUserRef ref) {
//   return ChatUseCase.getUser();
// }

// // @riverpod
// // Future<List<QuerySnapshot<MessageModel>>> messageSentByme(
// //     MessageSentBymeRef ref) {
// //   return ChatUseCase.messageSentByMe().toList();
// // }
