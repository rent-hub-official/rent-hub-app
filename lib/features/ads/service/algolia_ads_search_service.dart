import 'package:algolia/algolia.dart';
import 'package:rent_hub/main.dart';

/// AlgoliaAdsSearchService class
/// This class is responsible for searching ads using Algolia
/// It uses the Algolia SDK to query the Algolia index
final class AlgoliaAdsSearchService {
  Future<List<AlgoliaObjectSnapshot>> searhcAds(
    String searchKeyword,
  ) async {
    /// Querying the Algolia index
    final query =
        MyApp.algolia.instance.index('ads_index').query(searchKeyword);

    /// Getting the search results
    final result = await query.getObjects();

    /// Returning the search results
    return result.hits;
  }
}
