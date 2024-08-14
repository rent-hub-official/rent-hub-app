import 'dart:async';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rent_hub/core/constants/urls_constants.dart';
import 'package:rent_hub/core/exception/google_map_exception/google_map_exception.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart'
    as exception;
import 'package:rent_hub/core/secret_keys.dart';
import 'package:rent_hub/features/ads/service/entity/selected_location_entity.dart';
import 'package:rent_hub/object_box_service.dart';
import 'package:rent_hub/objectbox.g.dart';

///Google map places service class
///This class for google map api calling for search locations and get long lat

final class LocationService {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: UrlsConstants.googlePlaces,
    ),
  );

  ///search loacton by user inputs
  ///return the the suggested locations to search query
  static Future<dynamic> searchLocations(String searchQuery) async {
    try {
      final response = await _dio.post(
        ':autocomplete',
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

      if (response.statusCode == 200)
        return response.data;
      else
        throw GoogleMapException(
          responseMessage: response.statusMessage,
          statusCode: response.statusCode,
        );
    } on DioException catch (e) {
      throw GoogleMapException(error: e.message);
    }
  }

  // convert place id to LatLong
  static Future<dynamic> getLatLong(String placeId) async {
    try {
      final response = await _dio.get(
        "/$placeId",
        options: Options(
          headers: {
            'X-Goog-Api-Key': SecretKeys.googleMapApiKey,
            'X-Goog-FieldMask': 'location,displayName'
          },
        ),
      );

      if (response.statusCode == 200)
        return response.data;
      else
        throw GoogleMapException(
          responseMessage: response.statusMessage,
          statusCode: response.statusCode,
        );
    } on DioException catch (e) {
      throw GoogleMapException(error: e.message);
    }
  }

  static Future<dynamic> getPlaceDetailsFromLatLng(LatLng latLng) async {
    try {
      final response = await Dio().get(
        "${UrlsConstants.googleMaps}geocode/json",
        queryParameters: {
          'latlng': '${latLng.latitude},${latLng.longitude}',
          'key': SecretKeys.googleMapApiKey,
        },
      );

      if (response.statusCode == 200)
        return response.data;
      else
        throw GoogleMapException(
          responseMessage: response.statusMessage,
          statusCode: response.statusCode,
        );
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
