import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

class MyProductUsecase {
  Future<List<AdsModel>> call() async {
    try {
      final data = await AdsService.getMyProduct();
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
