import 'package:rent_hub/features/chat/service/chat_service.dart';

class GetUsersUseCase {
  Future<List<String>> call(String userId) async {
    /// Get all messages of a current user
    final messages = await ChatService.getAllMessages();

    final Set<String> messageSet = {};

    /// getting all the users who have sent or received messages to the current user
    /// and adding them to the set
    /// removing the current user from the set
    messages.docs.forEach(
      (e) {
        messageSet.add(e.data().receiverId);
        messageSet.add(e.data().senderId);
      },
    );
    messageSet.remove(userId);

    /// returning the list of users
    return messageSet.toList();
  }
}
