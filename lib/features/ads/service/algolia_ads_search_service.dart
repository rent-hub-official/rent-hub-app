import 'dart:developer';

import 'package:algolia/algolia.dart';
import 'package:rent_hub/main.dart';

final class AlgoliaAdsSearchService {
  Future<List<AlgoliaObjectSnapshot>> searhcAds(String searchKeyword) async {
    final query =
        MyApp.algolia.instance.index('ads_index').query(searchKeyword);
    final result = await query.getObjects();
    log(result.hits.toString());

    return result.hits;
  }
}
