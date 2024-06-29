import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/chat/service/chat_service.dart';

class UploadeAttachmentUseCase {
  Future<String?> call({file}) async {
    try {
      return ChatService.uploadAttachment(file);
    } on BaseException catch (e) {
      throw StorageException(e.message);
    }
  }
}
