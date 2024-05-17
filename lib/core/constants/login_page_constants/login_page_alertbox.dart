import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_page_alertbox.g.dart';

class LoginPageAlertBox {
  final String txtHeading = "Confirm your number";
  final String txtSubHeading = "check your phone number";
  final String txtPhnNo = "+91 0000000000";
  final String editBtn = "Edit";
  final String continueBtn = "Continue";
}

@riverpod
LoginPageAlertBox loginPageAlertBox(LoginPageAlertBoxRef ref) {
  return
  LoginPageAlertBox();
}
