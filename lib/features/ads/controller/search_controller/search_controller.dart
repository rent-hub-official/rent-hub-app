import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/ads_search_use_case/get_ads_with_id_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

@riverpod
class SearchAds extends _$SearchAds {
  @override
  FutureOr<List<DocumentSnapshot<AdsModel>>?> build() async {
    return null;
  }

  /// Search for the given query text in the ads collection
  /// and update the searched products state
  Future<void> searchAds(String queryText) async {
    try {
      state = AsyncLoading();

      final searchResults = await GetAdsWithIdUseCase()(queryText);
      state = AsyncData(searchResults);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
