import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/chat/service/seller_product_service.dart';

class SellerProductUseCase {
  Future<QuerySnapshot<AdsModel>> call({required String sellerId}) async {
    try {
      return await SellerProductService.getSellerProduct(sellerId: sellerId);
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
