import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/service/entity/selected_location_entity.dart';
import 'package:rent_hub/features/ads/service/location_service.dart';

final class GetUserSelectedLocationUsecase {
  SelectedLocationEntity? call() {
    try {
      return LocationService.getUserSelectedLocation();
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
