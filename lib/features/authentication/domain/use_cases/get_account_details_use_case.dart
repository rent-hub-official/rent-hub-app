import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';

// get account details
final class GetAccountDeatailsUseCase {
  Future<DocumentSnapshot<AccountDetailsModel>> call(String userId) async {
    try {
      return await AccountDetailsService.firebaseFirestoreInstance
          .withConverter(
            fromFirestore: AccountDetailsModel.fromFirestore,
            toFirestore: AccountDetailsModel.toFirestore,
          )
          .doc(userId)
          .get();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}
