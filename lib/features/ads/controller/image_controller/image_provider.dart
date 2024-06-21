import 'dart:io';

import 'package:rent_hub/features/ads/domain/usecase/product_use_case/product_image_upload_usecase.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/imge_picker_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_provider.g.dart';

@riverpod
class Image extends _$Image {
  @override
  List<String> build() {
    return [];
  }

  Future<void> upload({required String userId}) async {
    // pick image from gallery
    final image = await ImagePickerUseCase()();

    // upload image storage
    final imageRef = await ProductImageUploadUseCase()(
        image: File(image!.path), userId: userId);

    state = [...state, imageRef];
  }
}
