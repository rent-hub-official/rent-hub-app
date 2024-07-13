import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

class SellerProductService{
   static Future<QuerySnapshot<AdsModel>> getSellerProduct({required sellerId}) async {
    try {
      final MyProduct = await AdsService.adsDb
          .where('sellerId', isEqualTo:sellerId)
          .get();
      return MyProduct;
    } catch (e) {
      throw "Failed to fetch user products: ${e.toString()}";
    }
  }
}