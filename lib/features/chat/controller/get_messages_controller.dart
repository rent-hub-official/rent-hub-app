import 'package:rent_hub/features/chat/domain/model/message_model.dart';
import 'package:rent_hub/features/chat/domain/usecase/get_messages_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_messages_controller.g.dart';

@riverpod
Stream<List<MessageModel>> getMessages(GetMessagesRef,
    {required String userId}) {
  return GetMessagesUseCase()(userId);
}
