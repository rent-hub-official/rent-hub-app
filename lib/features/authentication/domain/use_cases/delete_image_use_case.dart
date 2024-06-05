import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';

// delete image from cloud storage

final class DeleteImageUseCase {
  Future<void> call({required String userId}) async {
    try {
      await AccountDetailsService.firebaseStorageReference
          .child(userId)
          .delete();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}
