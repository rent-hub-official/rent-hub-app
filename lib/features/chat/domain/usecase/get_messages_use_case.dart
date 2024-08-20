import 'package:rent_hub/features/chat/domain/model/message_model.dart';
import 'package:rent_hub/features/chat/service/chat_service.dart';

class GetMessagesUseCase {
  Stream<List<MessageModel>> call(String userId) async* {
    final messagesStream = ChatService.getMessages(userId);

    await for (final messagesList in messagesStream) {
      yield messagesList.docs.map((e) => e.data()).toList();
    }
  }
}
