import 'package:rent_hub/core/exception/base_exception.dart';

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
