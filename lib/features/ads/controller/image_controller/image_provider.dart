import 'package:rent_hub/features/ads/controller/image_controller/image_state.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/delete_image_usecase.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/product_image_upload_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_provider.g.dart';

@riverpod
class Image extends _$Image {
  @override
  ImageState build() {
    return ImageState(imageRefList: [], isLoading: false);
  }

  Future<void> upload() async {
    state = state.copyWith(isLoading: true);

    final imageRef = await ProductImageUploadUseCase()();
    if (imageRef != null) {
      state = state.copyWith(
        imageRefList: [...state.imageRefList, imageRef],
        isLoading: false,
      );
    }
  }

  Future<void> delete({required String imageRef}) async {
    state = state.copyWith(isLoading: true);

    await DeleteImageUsecase()(imagePath: imageRef);

    state = ImageState(
      imageRefList: state.imageRefList
          .where(
            (element) => element != imageRef,
          )
          .toList(),
      isLoading: false,
    );
  }
}
