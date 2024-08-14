import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

class SellerProductService {
  static Future<QuerySnapshot<AdsModel>> getSellerProduct(
      {required sellerId}) async {
    try {
      return await AdsService.adsDb
          .where('sellerId', isEqualTo: sellerId)
          .get();
    } catch (e) {
      throw "Failed to fetch user products: ${e.toString()}";
    }
  }
}
