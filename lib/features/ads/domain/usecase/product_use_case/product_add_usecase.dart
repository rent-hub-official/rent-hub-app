import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snackbar_utils.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';
import 'package:rent_hub/main.dart';

class ProductAddUsecase {
  Future<void> call({
    required AdsModel adsModel,
  }) async {
    try {
      await AdsService.addData(adsModel);

      App.navigatorKey.currentContext?.pop();
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
