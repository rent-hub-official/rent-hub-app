import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_hub/core/exception/authentication_exception/signout_exception.dart';
import 'package:rent_hub/features/authentication/service/authentication_service.dart';

final class LogOutUseCase {
  // log out
  Future<void> call() async {
    try {
      await AuthenticationService.firebaseAuthInstance.signOut();
    } on FirebaseAuthException catch (e) {
      throw SignOutException(e.message);
    }
  }
}
