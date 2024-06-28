import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

// get category

class GetCategoryUseCase {
  Future<QuerySnapshot<Map<String, dynamic>>> call() async {
    try {
      return AdsService.getCategory();
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
