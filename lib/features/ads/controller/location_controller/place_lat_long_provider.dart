import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/features/ads/domain/model/lat_long_model/lat_long_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/location_use_case/get_place_lat_long_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'place_lat_long_provider.g.dart';

@riverpod
class PlaceLatLong extends _$PlaceLatLong {
  @override
  FutureOr<LatLongModel?> build() {
    return null;
  }

  Future<void> get(String placeId) async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        return await GetPlaceLatLongUsecase()(placeId);
      },
    );
  }
}

final locationBtnProvider = StateProvider<bool>((ref) {
  return false;
});
