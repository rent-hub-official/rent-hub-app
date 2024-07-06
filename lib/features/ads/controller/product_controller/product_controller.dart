import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
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
  Future<void> addData({required AdsModel adsmodel}) async {
    state = true;

    await ProductAddUsecase()(adsmodel: adsmodel);

    state = false;
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
