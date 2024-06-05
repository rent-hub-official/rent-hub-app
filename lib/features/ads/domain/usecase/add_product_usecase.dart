import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

class ProductAddUsecase {
  // add data
  static Future<void> call({required AdsModel adsmodel}) async {
    try {
      await AdsService.adsDb
          .withConverter(
            fromFirestore: AdsModel.fromFirestore,
            toFirestore: AdsModel.toFireStore,
          )
          .add(adsmodel);
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}

class ProductImageUploadUseCase {
  // upload product image  Storage
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

class ProductUpdateUseCase {
  // update data
  static Future<void> call(
      {required String id, required AdsModel adsmodel}) async {
    try {
      await AdsService.adsDb
          .withConverter(
            fromFirestore: AdsModel.fromFirestore,
            toFirestore: AdsModel.toFireStore,
          )
          .doc(id)
          .set(adsmodel);
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}

class GetCategoryUseCase {
  // get category
  static Future<QuerySnapshot<Map<String, dynamic>>> call() async {
    try {
      return await AdsService.categoryDb.orderBy('name').get();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}
