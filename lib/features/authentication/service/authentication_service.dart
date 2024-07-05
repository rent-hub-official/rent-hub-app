
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_hub/core/exception/authentication_exception/otp_verify_exception.dart';
import 'package:rent_hub/core/exception/authentication_exception/signout_exception.dart';
import 'package:rent_hub/core/exception/authentication_exception/signup_exception.dart';

// authentication service

final class AuthenticationService {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  // verify phone number

  static Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(String verificationId, int? forceResendingToken)
        codeSent,
  }) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {},
        codeSent: codeSent,
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      throw SignupException(e.message);
    }
  }

  // otp verification and sigin with credintial

  static Future<UserCredential> SigninWithOtpCredential({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      //phone number auth credential
      final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      return await auth.signInWithCredential(phoneAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw VerifyOTPException(
        error: e.message,
      );
    }
  }

  // logout

  static Future<void> logout() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw SignOutException(e.message);
    }
  }
}
