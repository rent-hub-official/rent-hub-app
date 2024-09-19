import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snackbar_utils.dart';
import 'package:rent_hub/features/authentication/service/authentication_service.dart';
import 'package:rent_hub/features/authentication/view/pages/create_account_page.dart';
import 'package:rent_hub/features/authentication/view/pages/login_page.dart';
import 'package:rent_hub/main.dart';

final class SigninWithOtpCredentialUseCase {
  //log in with credintial

  call({
    required String? verificationId,
    required String smsCode,
  }) async {
    try {
      if (verificationId != null) {
        final userCredential =
            await AuthenticationService.SigninWithOtpCredential(
          verificationId: verificationId,
          smsCode: smsCode,
        );

        if (userCredential.user != null) {
          // Navigate to create user
          App.navigatorKey.currentContext!.go(CreateAccountPage.routePath);
        } else {
          // user credential is null
          SnackbarUtils.showError("Authentication failed please try again");
        }
      } else {
        // verification id is null
        SnackbarUtils.showError("Something went wrong please try again");

        // navigate to login page
        App.navigatorKey.currentContext!.go(LoginPage.routePath);
      }
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
