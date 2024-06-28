import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_page_constants.g.dart';

class LoginPageConstants {
  final txtHeading = "Welcome Back!";
  final txtSubHeding = "Please enter your phone number";
  final txtPhoneNo = "Phone number";
  final txtPhoneNoExample = 'e.g:"9876543210"';
  final txtOtpBtn = "Get Otp";
}

@riverpod
LoginPageConstants loginPageConstants(LoginPageConstantsRef ref) {
  return LoginPageConstants();
}
