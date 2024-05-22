import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_hub/core/exception/authentication_exception/authentication_exception.dart';
import 'package:rent_hub/core/exception/authentication_exception/otp_verify_exception.dart';
import 'package:rent_hub/core/exception/authentication_exception/signout_exception.dart';
import 'package:rent_hub/core/exception/authentication_exception/signup_exception.dart';
import 'package:rent_hub/features/authentication/service/authentication_service.dart';

//authentication use cases

final class AuthenticationUseCases {
  static final _auth = AuthenticationService.firebaseAuthInstance;

  // authentication state changes
  static Stream<User?> authStateChanges() {
    try {
      return _auth.authStateChanges();
    } on FirebaseAuthException catch (e) {
      throw AuthException(error: e.message);
    }
  }

  // phone number verification
  static Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(String verificationId, int? forceResendingToken)
        codeSent,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
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

  //log in with credintial
  static Future<UserCredential> signinWithOtpCredential({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      //phone number auth credential
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      return await _auth.signInWithCredential(phoneAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw VerifyOTPException(
        error: e.message,
      );
    }
  }

  // log out
  static Future<void> logOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw SignOutException(error: e.message);
    }
  }
}
