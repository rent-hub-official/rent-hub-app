import 'package:rent_hub/core/exception/base_exception.dart';

/// Any exception that occurs during the Google Map API request or displaying
/// the google map in the app.
final class GoogleMapException extends BaseException {
  final int? statusCode;
  final String? error;
  final String? responseMessage;

  const GoogleMapException({this.statusCode, this.error, this.responseMessage})
      : super(
          message: statusCode == null
              ? error ??
                  "Some unknown issue occurred. Check your internet connection and try again."
              : responseMessage ??
                  "Request failed with statusCode $statusCode. Please request again.",
        );
}
