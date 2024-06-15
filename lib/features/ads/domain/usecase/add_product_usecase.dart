import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

class ProductAddUsecase {
  // add data
  Future<void> call({required AdsModel adsmodel}) async {
    try {
      await AdsService.adsDb
          .withConverter(
            fromFirestore: AdsModel.fromFirestore,
            toFirestore: AdsModel.toFireStore,
          )
          .add(adsmodel);
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }
}
