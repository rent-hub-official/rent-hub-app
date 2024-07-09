import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

class MyProductUsecase {
  Future<QuerySnapshot<AdsModel>> call()async {
    try {
      return await AdsService.getMyProduct();
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
