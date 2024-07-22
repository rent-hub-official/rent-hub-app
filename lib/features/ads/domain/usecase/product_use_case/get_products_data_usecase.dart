import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

// get Categarised products usecase
class GetProductsDataUsecase {
  Future<List<QueryDocumentSnapshot<AdsModel>>> call({String? catagory}) async {
    try {
      // get catagory id with catagory name
      String categoryId = '';

      if (catagory != null) {
        // fetch catagory data
        final catagoryData = await AdsService.getCategory();

        final catagoryRef = catagoryData.docs;

        for (final data in catagoryRef) {
          if (data.data().name == catagory) categoryId = data.id;
        }
      }

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
