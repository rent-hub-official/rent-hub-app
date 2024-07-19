import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/utils/snakbar/toaster_util.dart';
import 'package:rent_hub/features/ads/domain/model/place_model/place_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/location_use_case/get_place_details_from_latlng_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'place_details_provider.g.dart';

@riverpod
class PlaceDetails extends _$PlaceDetails {
  @override
  FutureOr<PlaceModel?> build() {
    return null;
  }

  Future<void> fromLatlng(LatLng latLng) async {
    if (latLng != LatLng(0, 0)) {
      state = AsyncValue.loading();

      state = await AsyncValue.guard(
        () async {
          return await GetPlaceDetailsFromLatlngUsecase()(latLng);
        },
      );
    } else {
      ToasterUtil.showMessage(message: "Select your location");
    }
  }
}
