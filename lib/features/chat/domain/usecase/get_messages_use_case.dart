import 'package:rent_hub/features/chat/domain/model/message_model.dart';
import 'package:rent_hub/features/chat/service/chat_service.dart';

class GetMessagesUseCase {
  Future<List<MessageModel>> call(String userId) async {
    final messages = await ChatService.getMessages(userId);
    return messages.docs
        .map(
          (e) => e.data(),
        )
        .toList();
  }
}
