import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/get_products_data_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_catagary_products_provider.g.dart';

//fetch categorised products
@riverpod
Future<List<QueryDocumentSnapshot<AdsModel>>> fetchCatagorisedProducts(
    FetchCatagorisedProductsRef ref,
    {String? catagory}) async {
  return GetProductsDataUsecase()(catagory: catagory);
}
