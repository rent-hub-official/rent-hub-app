import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/chat/service/seller_product_service.dart';

class SellerProductUseCase {
  Future<List<AdsModel>> call({required String sellerId}) async {
    try {
      final data = await SellerProductService.getSellerProduct(sellerId: sellerId);
      return data.docs
          .map(
            (e) => e.data(),
          )
          .toList();
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
