import 'package:rent_hub/features/chat/domain/model/message_model.dart';
import 'package:rent_hub/features/chat/service/chat_service.dart';

class GetMessagesUseCase {
  Stream<Map<DateTime, List<MessageModel>>> call(String userId) async* {
    final messagesStream = ChatService.getMessages(userId);

    await for (final messagesList in messagesStream) {
      final allMessages = messagesList.docs.map((e) => e.data()).toList();
      final messagesMap = <DateTime, List<MessageModel>>{};

      final firstMessageDate = allMessages.first.time.toDate();

      DateTime currenDate = DateTime(
          firstMessageDate.year, firstMessageDate.month, firstMessageDate.day);
      final messagesInGivenDate = <MessageModel>[];

      for (final message in allMessages) {
        final messageDateTime = message.time.toDate();
        final messageDate = DateTime(
            messageDateTime.year, messageDateTime.month, messageDateTime.day);

        if (messageDate != currenDate) {
          messagesMap[currenDate] = [...messagesInGivenDate];

          messagesInGivenDate.clear();
          currenDate = messageDate;
        }

        messagesInGivenDate.add(message);
      }

      if (messagesInGivenDate.isNotEmpty) {
        messagesMap[currenDate] = [...messagesInGivenDate];
      }

      yield messagesMap;
    }
  }
}
