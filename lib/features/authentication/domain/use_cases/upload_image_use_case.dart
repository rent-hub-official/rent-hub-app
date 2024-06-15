import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';

//upload image for cloud storage

final class UploadImageUseCase {
  Future<String> call({required File image, required String userId}) async {
    try {
      await AccountDetailsService.firebaseStorageReference
          .child(userId)
          .putFile(image);
      return await AccountDetailsService.firebaseStorageReference
          .child(userId)
          .getDownloadURL();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }
}
