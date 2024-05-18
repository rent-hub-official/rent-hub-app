import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chat_box.g.dart';

class ChatBox {
  final txtHeading = "ChatBox";
  final txtType = "Type Something";
}

@riverpod
ChatBox chatBox(ChatBoxRef ref) {
  return ChatBox();
}
