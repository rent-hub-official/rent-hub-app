import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/chat/domain/usecase/my_product_use_case/seller_product_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'seller_product_controller.g.dart';

@riverpod
Future<QuerySnapshot<AdsModel>> sellerProduct(SellerProductRef ref,
    {required String sellerId}) async {
  return await SellerProductUseCase()(sellerId: sellerId);
}
