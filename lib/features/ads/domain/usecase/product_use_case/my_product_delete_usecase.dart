import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

class MyProductDeleteUsecase {
  Future<void> call(id) async {
    try {
      await AdsService.deleteMyProduct(id);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
