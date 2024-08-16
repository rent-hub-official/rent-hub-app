import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

// get Categarised products usecase
class GetProductsDataUsecase {
  Future<List<AdsModel>> call({String? catagory}) async {
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

        return data.docs.map((element) {
          return element.data();
        }).toList();
      } else {
        // fetch all categorised products
        final data = await AdsService.getCategorisedProducts(categoryId);

        return data.docs.map((element) {
          return element.data();
        }).toList();
      }
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
