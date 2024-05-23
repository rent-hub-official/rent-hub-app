import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chat_box.g.dart';

class ChatBoxConstants {
  final txtHeading = "ChatBox";
  final txtType = "Type Something";
}

@riverpod
ChatBoxConstants chatBoxConstants(ChatBoxConstantsRef ref) {
  return ChatBoxConstants();
}
