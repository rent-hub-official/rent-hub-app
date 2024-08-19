import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/chat/service/chat_service.dart';

class GetUserUseCase {
  Future<List<AccountDetailsModel>> call() async {
    try {
      final users = await ChatService.getAllUser();
      return users.docs.map((e) => e.data()).toList();
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
