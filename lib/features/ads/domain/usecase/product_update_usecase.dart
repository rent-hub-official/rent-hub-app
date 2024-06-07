import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

// update data

class ProductUpdateUseCase {
   Future<void> call(
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
