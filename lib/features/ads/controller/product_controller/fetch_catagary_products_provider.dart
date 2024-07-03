import 'package:flutter/material.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/get_products_data_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_catagary_products_provider.g.dart';

//fetch categorised products
@riverpod
Stream<List<AdsModel>> fetchCatagorisedProducts(FetchCatagorisedProductsRef ref,
    {required BuildContext context, String? catagory}) async* {
  yield* GetProductsDataUsecase()(catagory: catagory);
}
