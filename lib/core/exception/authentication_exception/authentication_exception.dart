import 'package:rent_hub/core/exception/base_exception.dart';

final class AuthException extends BaseException {
  const AuthException(String? message)
      : super(message: message ?? 'Unknown Exception');
}
