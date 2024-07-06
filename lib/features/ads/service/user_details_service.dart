import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/domain/model/account_details_model/account_details_model.dart';

final class UserDetailsService {
  static final db =
      FirebaseFirestore.instance.collection('users').withConverter(
            fromFirestore: AccountDetailsModel.fromFirestore,
            toFirestore: AccountDetailsModel.toFirestore,
          );
//get user data
  static Future<DocumentSnapshot<AccountDetailsModel>> getData(
    String userId,
  ) async {
    try {
      return await db.doc(userId).get();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }
}
