import 'package:rent_hub/features/ads/domain/model/place_suggestion_model/place_prediction.dart';
import 'package:rent_hub/features/ads/domain/usecase/location_search_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_search_provider.g.dart';

@riverpod
class LocationSearch extends _$LocationSearch {
  @override
  FutureOr<List<PlacePrediction>> build() {
    return [];
  }

  Future<void> search(String searchQuery) async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        return await LocationSearchUsecase()(searchQuery);
      },
    );
  }
}
