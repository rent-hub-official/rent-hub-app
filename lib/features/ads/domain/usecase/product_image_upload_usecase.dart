import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

// upload product image  Storage

class ProductImageUploadUseCase {
  static Future<String> call(
      {required File image, required String userId}) async {
    try {
      await AdsService.adsStorage
          .child("$userId${basename(image.path)}")
          .putFile(image);

      return await AdsService.adsStorage
          .child("$userId${basename(image.path)}")
          .getDownloadURL();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}
