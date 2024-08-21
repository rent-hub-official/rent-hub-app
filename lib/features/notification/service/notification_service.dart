import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';

class NotificationService {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final db =
      FirebaseFirestore.instance.collection('users').withConverter(
            fromFirestore: AccountDetailsModel.fromFirestore,
            toFirestore: AccountDetailsModel.toFirestore,
          );

  Future<String?> getFcmTokenFromMessaging(String? currentUser) async {
    try {
      if (currentUser != null) {
        final fcmToken = await _firebaseMessaging.getToken();
        return fcmToken;
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<DocumentSnapshot<AccountDetailsModel>> getFcmTokenFromDb({
    required String id,
  }) async {
    final fcmToken = await db.doc(id).get();
    return fcmToken;
  }
}
