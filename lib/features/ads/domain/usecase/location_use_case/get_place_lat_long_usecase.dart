import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/coordinates/coordinates_model.dart';
import 'package:rent_hub/features/ads/service/location_service.dart';

final class GetPlaceLatLongUsecase {
  Future<CoodinatesModel> call(String placeId) async {
    try {
      final result = await LocationService.getLatLong(placeId);

      return CoodinatesModel.fromJson(result["location"]);
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
