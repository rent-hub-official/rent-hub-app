import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';

// account deatils use cases
final class AccountDetailsUseCases {
  // firestore users instances
  static final _db =
      AccountDetailsService.firebaseFirestoreInstance.withConverter(
    fromFirestore: AccountDetailsModel.fromFirestore,
    toFirestore: AccountDetailsModel.toFirestore,
  );

  // storage users profile instances
  static final Reference _storageRefernce =
      AccountDetailsService.firebaseStorageReference;

  //upload image for cloud storage
  static Future<String> uploadImage(
      {required File image, required String userId}) async {
    try {
      await _storageRefernce.child(userId).putFile(image);
      return await _storageRefernce.child(userId).getDownloadURL();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }

  // delete image from cloud storage
  static Future<void> deleteImage({required String userId}) async {
    try {
      await _storageRefernce.child(userId).delete();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }

  //Upload user details
  static Future<void> uploadUserDeatails({
    required String userId,
    required AccountDetailsModel accountDetails,
  }) async {
    try {
      await _db.doc(userId).set(
            accountDetails,
          );
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }

  // get account details
  static Future<DocumentSnapshot<AccountDetailsModel>> getAccountDetails(
      String userId) async {
    try {
      return await _db.doc(userId).get();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}
