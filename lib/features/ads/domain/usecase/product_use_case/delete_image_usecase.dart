import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

final class DeleteImageUsecase {
  call({required String imagePath}) async {
    try {
      await AdsService.deleteImage(imageUrl: imagePath);
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
