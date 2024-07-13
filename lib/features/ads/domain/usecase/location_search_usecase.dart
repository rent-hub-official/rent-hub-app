import 'dart:developer';

import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/place_suggestion_model/place_prediction.dart';
import 'package:rent_hub/features/ads/service/location_service.dart';

final class LocationSearchUsecase {
  Future<List<PlacePrediction>> call(String searchQuery) async {
    try {
      if (searchQuery.isEmpty) return [];

      final data = await LocationService.searchLocations(searchQuery)
          as Map<String, dynamic>;

      if (data.isEmpty) return [];

      final placeList = data["suggestions"] as List<dynamic>;

      return placeList
          .map(
            (data) => PlacePrediction.fromJson(data["placePrediction"]),
          )
          .toList();
    } on BaseException catch (e) {
      log(e.message);
      throw e.message;
    }
  }
}
