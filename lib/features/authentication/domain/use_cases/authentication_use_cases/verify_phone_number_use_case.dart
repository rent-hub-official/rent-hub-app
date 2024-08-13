import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/features/authentication/service/authentication_service.dart';
import 'package:rent_hub/features/authentication/view/pages/otp_verification_page.dart';
import 'package:rent_hub/main.dart';

final class VerifyPhoneNumberUseCase {
  // phone number verification
  call({
    required String phoneNumber,
    required void Function(
      String verificationId,
      int? forceResendingToken,
    ) codeSent,
  }) async {
    try {
      await AuthenticationService.verifyPhoneNumber(
          phoneNumber: phoneNumber, codeSent: codeSent);

      // navigate to otppage
      App.navigatorKey.currentContext!.go(OtpVerificationPage.routePath);
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
