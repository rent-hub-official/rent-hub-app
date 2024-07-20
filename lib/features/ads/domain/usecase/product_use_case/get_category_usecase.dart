import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/category_model/category_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

// get category

class GetCategoryUseCase {
  Future<List<CategoryModel>> call() async {
    try {
      final result = await AdsService.getCategory();

      return result.docs
          .map(
            (e) => e.data(),
          )
          .toList();
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
