import 'package:rent_hub/core/exception/base_exception.dart';

/// An exception that will be thwon when OTP verification fails.
final class OTPVerificationFailedException extends BaseException {
  final int? statusCode;
  final String? error;
  final String? responseMessage;

  const OTPVerificationFailedException(
      {this.statusCode, this.error, this.responseMessage})
      : super(
          message: statusCode == null
              ? error ??
                  "Some unknown issue occurred. Check your internet connection and try again."
              : responseMessage ??
                  "OTP verification failed with statusCode $statusCode. Please request again.",
        );
}
