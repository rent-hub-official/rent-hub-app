import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

// get all products use
class FetchAllProductsData {
  static Stream<QuerySnapshot<AdsModel>> FetchProducts() async* {
    try {
      final data = await AdsService.adsDb
          .withConverter(
              fromFirestore: AdsModel.fromFirestore,
              toFirestore: AdsModel.toFireStore)
          .snapshots();
      yield* data;
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }
}
