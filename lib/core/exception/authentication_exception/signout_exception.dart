import 'package:rent_hub/core/exception/base_exception/base_exception.dart';

class SignOutException extends BaseException {
  String? error;

  SignOutException({this.error, String? message})
      : super(message: error ?? "Unknown SignOutException");
}