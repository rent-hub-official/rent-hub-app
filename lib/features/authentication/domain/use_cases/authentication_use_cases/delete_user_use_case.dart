import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/core/utils/snakbar/toaster_util.dart';
import 'package:rent_hub/features/authentication/service/authentication_service.dart';
import 'package:rent_hub/features/authentication/view/pages/login_page.dart';
import 'package:rent_hub/main.dart';

class DeleteUserUseCase {
  final isUserNotLoggedIn = FirebaseAuth.instance.currentUser == null;

  // Delete
  Future<void> call() async {
    try {
      if (!isUserNotLoggedIn) {
        await AuthenticationService.deleteAccount();

        // Delete successful toast
        ToasterUtil.showMessage(message: "Successfully deleted");

        // Navigate to login screen
        MyApp.navigatorKey.currentContext!.push(LoginPage.routePath);
      } else {
        // Optionally show a message if user is not logged in
        ToasterUtil.showMessage(message: "No user logged in");
      }
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
