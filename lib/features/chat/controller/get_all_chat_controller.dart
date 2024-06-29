import 'package:rent_hub/features/chat/domain/model/message_model.dart';
import 'package:rent_hub/features/chat/domain/usecase/chat_use_case/get_all_message_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_all_chat_controller.g.dart';

@riverpod
Stream<List<MessageModel>> getAllMessage(GetAllMessageRef ref) async* {
  final data = await GetAllMessageUseCase()();

  await for (var event in data) {
    var allMessage = <MessageModel>[];

    for (var model in event.docs) {
      allMessage.add(model.data());
    }
    yield allMessage;
  }
}