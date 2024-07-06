import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/core/utils/snakbar/toaster_util.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/main.dart';

class ProductAddUsecase {
  // add data
  Future<void> call({required AdsModel adsmodel}) async {
    try {
      if (adsmodel.imagePath.length >= 3) {
        await AdsService.addData(adsmodel);

        MyApp.navigatorKey.currentContext?.pop();
      } else
        ToasterUtil.showMessage(message: "Add atleast three product image");
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
