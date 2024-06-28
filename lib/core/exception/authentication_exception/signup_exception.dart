import 'package:rent_hub/core/exception/base_exception.dart';

final class SignupException extends BaseException {
  const SignupException(String? message)
      : super(message: message ?? "'Unknown  BaseException'");
}
