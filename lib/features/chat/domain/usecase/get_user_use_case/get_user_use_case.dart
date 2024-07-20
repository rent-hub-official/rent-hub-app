import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/chat/service/chat_service.dart';

class GetUserUseCase {
  Stream<QuerySnapshot<AccountDetailsModel>> call() {
    try {
      return ChatService.getAllUser();
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
