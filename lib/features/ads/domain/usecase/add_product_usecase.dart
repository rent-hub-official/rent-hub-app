import 'package:firebase_core/firebase_core.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

class AddProductUsecase {
  void addTofireStore(
    AdsModel adsmodel,
  ) {
    try {
      AddAdsService.db
          .withConverter(
            fromFirestore: AdsModel.fromFirestore,
            toFirestore: AdsModel.toFireStore,
          )
          .doc()
          .set(adsmodel);
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}
