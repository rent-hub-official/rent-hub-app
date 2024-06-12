import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_hub/core/exception/authentication_exception/otp_verify_exception.dart';
import 'package:rent_hub/features/authentication/service/authentication_service.dart';

final class SigninWithOtpCredentialUseCase {
  //log in with credintial
  Future<UserCredential> call({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      //phone number auth credential
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      return await AuthenticationService.firebaseAuthInstance
          .signInWithCredential(phoneAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw VerifyOTPException(
        error: e.message,
      );
    }
  }
}
