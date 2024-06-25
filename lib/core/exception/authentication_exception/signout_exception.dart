import 'package:rent_hub/core/exception/base_exception.dart';

final class SignOutException extends BaseException {
  const SignOutException(String? message)
      : super(message: message ?? "Unknown SignOutException");
}
