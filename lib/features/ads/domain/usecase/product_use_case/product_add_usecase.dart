import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

class ProductAddUsecase {
  // add data
  Future<void> call({required AdsModel adsmodel}) async {
    try {
      await AdsService.addData(adsmodel);
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
