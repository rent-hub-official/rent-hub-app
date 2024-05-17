import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chat_box.g.dart';

class ChatBox {
  final String txtHeading = "ChatBox";
  final String txtType = "Type Something";
}

@riverpod
ChatBox chatBox(ChatBoxRef ref) {
  return ChatBox();
}
