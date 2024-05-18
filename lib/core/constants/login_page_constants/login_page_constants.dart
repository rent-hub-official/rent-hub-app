import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_page_constants.g.dart';

class LoginPageConstant {
  final txtHeading = "Welcome Back!";
  final txtSubHeding = "Please enter your phone number";
  final txtPhnNo = "+91 Your phone number";
  final txtOtpBtn = "Get Otp";
}

@riverpod
LoginPageConstant loginPageConstant(LoginPageConstantRef ref) {
  return LoginPageConstant();
}
