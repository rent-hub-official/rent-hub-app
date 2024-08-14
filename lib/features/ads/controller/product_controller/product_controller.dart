import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/utils/toast_utils.dart';
import 'package:rent_hub/features/ads/controller/location_controller/location_name_reduce_provider.dart';
import 'package:rent_hub/features/ads/controller/location_controller/place_details_provider.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/domain/model/place_model/place_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/product_add_usecase.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/product_update_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';

// State provider for the PageController used in the PageView
final pageControllerProvider =
    StateProvider<PageController>((ref) => PageController(initialPage: 0));

// add product controller
@riverpod
class Products extends _$Products {
  @override
  bool build() {
    return false;
  }

  // add product data
  Future<void> addData({
    required List<String> imagePaths,
    required String productName,
    required String? category,
    required String? description,
    required double price,
  }) async {
    PlaceModel? placeModel;

    ref.read(placeDetailsProvider).whenData(
      (value) {
        placeModel = value;
      },
    );

    if (imagePaths.length < 3) {
      ToastUtils.showMessage(message: "Pick at least three product photos");
    } else if (category == null) {
      ToastUtils.showMessage(message: "Select product category");
    } else if (placeModel == null) {
      ToastUtils.showMessage(message: "Select location");
    } else {
      state = true;

      final location = placeModel?.results?.first.geometry?.location;

      await ProductAddUsecase()(
        adsModel: AdsModel(
          imagePath: imagePaths,
          productName: productName,
          category: category,
          locationTitle: ref.read(
            locationNameReduceProvider(
              placeModel?.results?.first.formattedAddress,
            ),
          ),
          lat: location?.lat ?? 0,
          long: location?.lng ?? 0,
          description: description,
          price: price,
          dateCreated: DateTime.now(),
        ),
      );

      state = false;
    }
  }

  // update product data
  Future<void> updateData({
    required String id,
    required AdsModel adsmodel,
  }) async {
    state = true;

    await ProductUpdateUseCase()(adsmodel: adsmodel, id: id);

    state = false;
  }
}
