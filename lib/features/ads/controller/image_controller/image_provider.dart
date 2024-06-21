import 'package:rent_hub/features/ads/domain/usecase/product_use_case/product_image_upload_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_provider.g.dart';

@riverpod
class Image extends _$Image {
  @override
  List<String> build() {
    return [];
  }

  Future<void> upload({required String userId}) async {
    final imageRef = await ProductImageUploadUseCase()(userId: userId);
    if (imageRef != null) {
      state = [...state, imageRef];
    }
  }
}
