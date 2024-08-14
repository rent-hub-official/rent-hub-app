import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snackbar_utils.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

// update data

class ProductUpdateUseCase {
  Future<void> call({required String id, required AdsModel adsmodel}) async {
    try {
      await AdsService.updateData(id: id, adsmodel: adsmodel);
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
