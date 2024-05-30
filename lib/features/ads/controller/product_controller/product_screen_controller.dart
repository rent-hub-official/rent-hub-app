// State provider to toggle the read more functionality
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/exception/base_exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/error_snackbar.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/add_product_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_screen_controller.g.dart';

final readmoreTextProvider = StateProvider<bool>((ref) => false);

// State provider for the PageController used in the PageView
final pageController =
    StateProvider<PageController>((ref) => PageController(initialPage: 0));

@riverpod
class Products extends _$Products {
  @override
  bool build() {
    return false;
  }

  Future<void> addProduct(BuildContext context,
      {required AdsModel data}) async {
    state = true;
    try {
      await ProductUsecase.addTofireStore(data);
      Future.sync(
        () => ErrorSnackBar(context, errorMessage: 'Sucessfully Added..!'),
      );
    } on BaseException catch (e) {
      state = false;
      Future.sync(
        () => ErrorSnackBar(context, errorMessage: e.message),
      );
    }
    state = false;
  }
}
