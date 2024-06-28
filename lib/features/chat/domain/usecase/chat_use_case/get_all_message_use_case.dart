import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/chat/domain/model/message_model.dart';
import 'package:rent_hub/features/chat/service/chat_service.dart';

class GetAllMessageUseCase {
  Stream<QuerySnapshot<MessageModel>> call() {
    try {
      return ChatService.allMessage();
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
