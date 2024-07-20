import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

class MyProductUpadateUsecase {
  Future<void> call(String id, AdsModel adsmodel) async {
    try {
      return await AdsService.updateData(id: id, adsmodel: adsmodel);
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
