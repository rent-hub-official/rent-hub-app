import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/ads_search_use_case/ads_search_use_case.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';
import 'package:rent_hub/features/ads/service/ads_with_id_service.dart';

class GetAdsWithIdUseCase {
  /// returns a list of ads with id
  Future<List<AdsModel>> call(String queryText) async {
    try {
      final adsIds = await AdsSearchUsecase()(queryText: queryText);
      final adsList = <AdsModel>[];

      final catagoryData = await AdsService.getCategory();

      for (var adId in adsIds) {
        final adData = await AdsWithIdService().call(id: adId);

        /// Fetch the category details
        final categoryDetails = catagoryData.docs.firstWhere(
            (categorySnapshot) =>
                categorySnapshot.id == adData.data()!.category);
        adsList.add(
            adData.data()!.copyWith(category: categoryDetails.data().name));
      }

      return adsList;
    } catch (e) {
      throw Exception('Cannot get ads. Please try again.');
    }
  }
}
