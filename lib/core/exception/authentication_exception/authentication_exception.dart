import 'package:rent_hub/core/exception/base_exception/base_exception.dart';

class AuthException extends BaseException {
  String? error;
  AuthException({
    this.error,
    String? message,
  }) : super(message: error ?? 'Unknown Exception');
}
