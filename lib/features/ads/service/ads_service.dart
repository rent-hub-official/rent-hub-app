import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';

// Add product service
final class AdsService {
  // ads firestore instance
  static final adsDb =
      FirebaseFirestore.instance.collection('ads').withConverter(
            fromFirestore: AdsModel.fromFirestore,
            toFirestore: AdsModel.toFireStore,
          );

  // ads storage instance
  static final adsStorage = FirebaseStorage.instance.ref().child('adsImages');

  //category firestore instance
  static final categoryDb = FirebaseFirestore.instance.collection('category');

  static final auth = FirebaseAuth.instance;

  // add product data
  static Future<void> addData(AdsModel adsmodel) async {
    try {
      adsmodel = adsmodel.copyWith(sellerId: auth.currentUser!.phoneNumber);

      await adsDb.add(adsmodel);
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  /// get all avialable categories from firebase
  ///
  /// returns the snapshot with the category details as Map
  static Future<QuerySnapshot<Map<String, dynamic>>> getCategory() async {
    try {
      return await categoryDb.orderBy('name').get();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  // upload product image
  static Future<String> uploadImage({
    required File image,
  }) async {
    try {
      final userId = auth.currentUser!.phoneNumber;

      await adsStorage.child("$userId${basename(image.path)}").putFile(image);

      return await adsStorage
          .child("$userId${basename(image.path)}")
          .getDownloadURL();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  static Future<void> deleteImage({required String imageUrl}) async {
    try {
      FirebaseStorage.instance.refFromURL(imageUrl).delete();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  // update product data
  static Future<void> updateData({
    required String id,
    required AdsModel adsmodel,
  }) async {
    try {
      await adsDb
          .withConverter(
            fromFirestore: AdsModel.fromFirestore,
            toFirestore: AdsModel.toFireStore,
          )
          .doc(id)
          .set(adsmodel);
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  // get products
  static Future<QuerySnapshot<AdsModel>> getProducts() async {
    try {
      return await adsDb.get();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  // get categorised products
  static Future<QuerySnapshot<AdsModel>> getCategorisedProducts(
      String categoryId) async {
    try {
      return await adsDb.where('category', isEqualTo: categoryId).get();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  static Future<QuerySnapshot<AdsModel>> getMyProduct() async {
    try {
      final MyProduct = await AdsService.adsDb
          .where('sellerId', isEqualTo: auth.currentUser!.phoneNumber)
          .get();
      return MyProduct;
    } catch (e) {
      throw "Failed to fetch user products: ${e.toString()}";
    }
  }

 static Future<void> deleteMyProduct(String id) async{
    try {
     await  adsDb.doc(id).delete();
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
