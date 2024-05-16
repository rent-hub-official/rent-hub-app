import 'package:rent_hub/core/exception/base_exception/base_exception.dart';

class SignupException extends BaseException {
  String? error;
  SignupException({this.error, String? message})
      : super(message: error ?? "'Unknown  BaseException'");
}
