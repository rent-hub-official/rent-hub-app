import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_page_alertbox.g.dart';

class LoginPageAlertBox {
  final txtHeading = "Confirm your number";
  final txtSubHeading = "check your phone number";
  final txteditBtn = "Edit";
  final txtcontinueBtn = "Continue";
}

@riverpod
LoginPageAlertBox loginPageAlertBox(LoginPageAlertBoxRef ref) {
  return LoginPageAlertBox();
}
