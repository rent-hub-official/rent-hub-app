import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/ads_search_use_case/get_ads_with_id_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart'; // generated file

@riverpod
class SearchAds extends _$SearchAds {
  @override
  List<AdsModel> build() {
    return <AdsModel>[];
  }

  /// Search for the given query text in the ads collection
  /// and update the searched products state
  Future<void> searchAds(String queryText) async {
    try {
      final searchResults = await GetAdsWithIdUseCase()(queryText);

      state = searchResults;
    } catch (e) {
      //
    }
  }
}
