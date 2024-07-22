import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/place_model/place_model.dart';
import 'package:rent_hub/features/ads/service/location_service.dart';

final class GetPlaceDetailsFromLatlngUsecase {
  Future<PlaceModel> call(LatLng latLng) async {
    try {
      final result = await LocationService.getPlaceDetailsFromLatLng(latLng);

      return PlaceModel.fromJson(result);
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
