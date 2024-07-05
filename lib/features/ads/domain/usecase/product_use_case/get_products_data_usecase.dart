import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/get_category_usecase.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

// get Categarised products usecase
class GetProductsDataUsecase {
  Future<List<QueryDocumentSnapshot<AdsModel>>> call({String? catagory}) async {
    // get catagory id with catagory name
    String categoryId = '';
    if (catagory != null) {
      // fetch catagory data
      final catagoryData = await GetCategoryUseCase()();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> catagoryRef =
          catagoryData.docs.map((data) => data).toList();
      for (final data in catagoryRef) {
        if (data.data()['name'] == catagory) categoryId = data.id;
      }
    }

    try {
      if (catagory == null) {
        // fetch all products details
        final data = await AdsService.getProducts();
        return data.docs;
      } else {
        // fetch all categorised products
        final data = await AdsService.getCategorisedProducts(categoryId);
        return data.docs;
      }
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
