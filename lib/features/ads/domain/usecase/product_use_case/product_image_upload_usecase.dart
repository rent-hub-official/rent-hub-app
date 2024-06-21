import 'dart:io';

import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

// upload product image  Storage

class ProductImageUploadUseCase {
  Future<String> call({required File image, required String userId}) async {
    try {
      return await AdsService.uploadImage(userId: userId, image: image);
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);

      throw e.message;
    }
  }
}
