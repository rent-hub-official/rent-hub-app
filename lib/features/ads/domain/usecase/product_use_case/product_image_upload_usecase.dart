import 'dart:io';

import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snackbar_utils.dart';
import 'package:rent_hub/features/ads/domain/usecase/image_picker_use_case.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

// upload product image  Storage

class ProductImageUploadUseCase {
  Future<String?> call() async {
    try {
      final image = await ImagePickerUseCase()();

      if (image != null) {
        return await AdsService.uploadImage(
          image: File(image.path),
        );
      } else {
        return null;
      }
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);

      return null;
    }
  }
}
