import 'dart:io';

import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snackbar_utils.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

// upload product image  Storage
class ProductImageUploadUseCase {
  Future<String?> call(String filePath) async {
    try {
      return await AdsService.uploadImage(
        image: File(filePath),
      );
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);

      return null;
    }
  }
}
