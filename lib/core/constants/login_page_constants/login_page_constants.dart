import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_page_constants.g.dart';

class LoginPageConstant {
  final String txtHeading = "Welcome Back!";
  final String txtSubHeding = "Please enter your phone number";
  final String txtPhnNo = "+91 Your phone number";
  final String txtOtpBtn = "Get Otp";
}

@riverpod
LoginPageConstant loginPageConstant(LoginPageConstantRef ref) {
   return LoginPageConstant();
}
