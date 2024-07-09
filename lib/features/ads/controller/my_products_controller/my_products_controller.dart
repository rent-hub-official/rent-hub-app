import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/my_product_usecase.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/my_product_delete_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'my_products_controller.g.dart';

@riverpod
class MyProducts extends _$MyProducts {
  @override
  Future<QuerySnapshot<AdsModel>> build()async {
    return await MyProductUsecase()();
  }

  Future<void> deleteMyProduct({required String id}) async {
    await MyProductDeleteUsecase()(id);
  }
}


















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
// import 'package:rent_hub/features/ads/domain/usecase/my_product_usecase.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'my_products_controller.g.dart';

// @riverpod
// Future<QuerySnapshot<AdsModel>> myproduct(MyproductRef ref) async {
//   return await MyProductUsecase()();
// }
