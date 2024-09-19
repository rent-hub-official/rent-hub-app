import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_page_alertbox.g.dart';

class LoginPageAlertBoxConstants {
  final txtHeading = "Confirm your number";
  final txtSubHeading = "Check your phone number";
  final txteditBtn = "Edit";
  final txtcontinueBtn = "Continue";
}

@riverpod
LoginPageAlertBoxConstants loginPageAlertBoxConstants(
    LoginPageAlertBoxConstantsRef ref) {
  return LoginPageAlertBoxConstants();
}
