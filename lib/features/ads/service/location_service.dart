import 'package:dio/dio.dart';
import 'package:rent_hub/core/constants/urls_constants.dart';
import 'package:rent_hub/core/exception/google_map_exception/google_map_exception.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart'
    as exception;
import 'package:rent_hub/core/secret_keys.dart';
import 'package:rent_hub/features/ads/domain/entity/selected_location_entity.dart';
import 'package:rent_hub/features/ads/service/object_box_service.dart';
import 'package:rent_hub/objectbox.g.dart';

///Google map places service class
///This class for google map api calling for search locations and get long lat

final class LocationService {
  static final dio = Dio(
    BaseOptions(
      baseUrl: UrlsConstants.googleMapPlaces,
    ),
  );

  ///search loacton by user inputs
  ///return the the suggested locations to search query
  static Future<dynamic> searchLocations(String searchQuery) async {
    try {
      final response = await dio.post(
        'v1/places:autocomplete',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Goog-Api-Key': SecretKeys.googleMapApiKey,
          },
        ),
        queryParameters: {
          'input': searchQuery,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw GoogleMapException(
          responseMessage: response.statusMessage,
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw GoogleMapException(error: e.message);
    }
  }

  /// Save the user-selected location in storage
  static void saveUserSelectedLocation(SelectedLocationEntity location) {
    try {
      ObjectBoxService.instance.SelectedLocation.put(location);
    } on ObjectBoxException catch (e) {
      throw exception.StorageException(e.message);
    }
  }

  /// Retrieve the saved user-selected location from storage
  static SelectedLocationEntity? getUserSelectedLocation() {
    try {
      return ObjectBoxService.instance.SelectedLocation.get(1);
    } on ObjectBoxException catch (e) {
      throw exception.StorageException(e.message);
    }
  }
}
