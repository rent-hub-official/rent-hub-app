import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_hub/core/exception/authentication_exception/otp_verify_exception.dart';
import 'package:rent_hub/core/exception/authentication_exception/signout_exception.dart';
import 'package:rent_hub/core/exception/authentication_exception/signup_exception.dart';
import 'package:rent_hub/features/authentication/service/authentication_service.dart';

//authentication use cases

final class VerifyPhoneNumberUseCases {
  // phone number verification
  static Future<void> call({
    required String phoneNumber,
    required void Function(String verificationId, int? forceResendingToken)
        codeSent,
  }) async {
    try {
      await AuthenticationService.firebaseAuthInstance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {},
        codeSent: codeSent,
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      throw SignupException(error: e.message);
    }
  }
}

final class SigninWithOtpCredentialUseCase {
  //log in with credintial
  static Future<UserCredential> call({
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

final class LogOutUseCase {
  // log out
  static Future<void> call() async {
    try {
      await AuthenticationService.firebaseAuthInstance.signOut();
    } on FirebaseAuthException catch (e) {
      throw SignOutException(error: e.message);
    }
  }
}
