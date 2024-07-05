import 'package:rent_hub/features/ads/service/add_ads_service.dart';
import 'package:rent_hub/features/ads/service/algolia_ads_search_service.dart';

class AdsSearchUsecase {
  final adsDbref = AdsService.adsDb;

  Future<List<String>> call({
    required String queryText,
  }) async {
    final searchResult = await AlgoliaAdsSearchService().searhcAds(queryText);
    try {
      /// Converting algolia snapshots into list of Ad IDs
      /// to be used to fetch the actual ads from firestore
      /// using the AdsWithIdService
      return searchResult.map((e) => e.objectID).toList();
    } catch (e) {
      throw Exception('Cannot get ads. Please try again.');
    }
  }
}
