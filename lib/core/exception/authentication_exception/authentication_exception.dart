import 'package:rent_hub/core/exception/base_exception.dart';

/// Any general exception that occurs during the authentication process.
final class AuthException extends BaseException {
  const AuthException(String? message)
      : super(message: message ?? 'Unknown Exception');
}
