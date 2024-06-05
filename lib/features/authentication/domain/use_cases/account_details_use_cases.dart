import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';

// account deatils use cases
final class UploadImageUseCases {
  //upload image for cloud storage
  static Future<String> call(
      {required File image, required String userId}) async {
    try {
      await AccountDetailsService.firebaseStorageReference
          .child(userId)
          .putFile(image);
      return await AccountDetailsService.firebaseStorageReference
          .child(userId)
          .getDownloadURL();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}

final class DeleteImageUseCase {
  // delete image from cloud storage
  static Future<void> call({required String userId}) async {
    try {
      await AccountDetailsService.firebaseStorageReference
          .child(userId)
          .delete();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}

final class GetAccountDeatailsUseCase {
  // get account details
  static Future<DocumentSnapshot<AccountDetailsModel>> call(
      String userId) async {
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

final class AccountDeatailsAddUseCase {
  //Upload user details
  static Future<void> call({
    required String userId,
    required AccountDetailsModel accountDetails,
  }) async {
    try {
      await AccountDetailsService.firebaseFirestoreInstance
          .withConverter(
            fromFirestore: AccountDetailsModel.fromFirestore,
            toFirestore: AccountDetailsModel.toFirestore,
          )
          .doc(userId)
          .set(
            accountDetails,
          );
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}
