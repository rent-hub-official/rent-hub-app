import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/exception/base_exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/delight_toas_bar.dart';
import 'package:rent_hub/core/utils/snakbar/error_snackbar.dart';
import 'package:rent_hub/features/ads/controller/category_controller/category_provider.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/add_product_usecase.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_image_upload_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';

// State provider to toggle the read more functionality

final readmoreTextProvider = StateProvider<bool>((ref) => false);

// State provider for the PageController used in the PageView
final pageController =
    StateProvider<PageController>((ref) => PageController(initialPage: 0));

// add product controller
@riverpod
class AddProducts extends _$AddProducts {
  @override
  bool build() {
    return false;
  }

  Future<void> addProduct(BuildContext context,
      {required AdsModel data}) async {
    state = true;
    try {
      await ProductAddUsecase()(adsmodel: data);
      Future.sync(
        () {
          TosterUtil.showMessage(
              context: context,
              icon: Icon(
                Icons.thumb_up,
                color: Colors.black,
              ),
              message: 'Sucessfully added');
          // showAlertBox(text: 'text', context: context);
        },
      );
      ref.invalidate(ImageListProvider);
    } on BaseException catch (e) {
      state = false;
      Future.sync(
        () => ErrorSnackBar(context, errorMessage: e.message),
      );
    }
    state = false;
  }

  // add image
  Future<void> addImage(
    BuildContext context, {
    required File image,
    required String userId,
  }) async {
    try {
      String imagePath =
          await ProductImageUploadUseCase()(image: image, userId: userId);

      ref.read(ImageListProvider.notifier).state.add(imagePath);
      ref.invalidate(getCategorysProvider);
    } on BaseException catch (e) {
      Future.sync(
        () => ErrorSnackBar(context, errorMessage: e.message),
      );
    }
  }
}

// product image provider
final ImageListProvider = StateProvider<List<String>>((ref) => []);
