import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_hub/core/exception/authentication_exception/signup_exception.dart';
import 'package:rent_hub/features/authentication/service/authentication_service.dart';

final class VerifyPhoneNumberUseCase {
  // phone number verification
  Future<void> call({
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
      throw SignupException(e.message);
    }
  }
}
