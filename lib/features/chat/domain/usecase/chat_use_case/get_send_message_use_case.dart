import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snackbar_utils.dart';
import 'package:rent_hub/features/chat/service/chat_service.dart';

class GetSendMessageUseCase {
  Future<void> call({message, attachment}) async {
    try {
      await ChatService.sendMessage(message, attachment);
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
