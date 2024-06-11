import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/chat/domain/model/message_model.dart';

class ChatService {
  static final messageCollection =
      FirebaseFirestore.instance.collection('message').withConverter(
            fromFirestore: MessageModel.fromFirestore,
            toFirestore: MessageModel.toFirestore,
          );
}
