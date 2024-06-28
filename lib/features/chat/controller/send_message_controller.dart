import 'dart:io';
import 'package:rent_hub/features/chat/domain/model/message_model.dart';
import 'package:rent_hub/features/chat/domain/usecase/chat_use_case/uploade_attachment_use_case.dart';
import 'package:rent_hub/features/chat/domain/usecase/chat_use_case/get_send_message_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'send_message_controller.g.dart';

@riverpod
class SendMessageController extends _$SendMessageController {
  @override
  bool build() {
    return false;
  }

  Future<String?> uploadAttachment(
    File file,
  ) async {
    return await UploadeAttachmentUseCase()(file: file);
  }
  Future<void> sendMessage({
  required MessageModel message,
  File? attachment,
}) async {
  await GetSendMessageUseCase()(attachment: attachment, message: message);
}
}


