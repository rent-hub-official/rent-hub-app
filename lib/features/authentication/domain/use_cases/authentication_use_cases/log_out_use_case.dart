import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snackbar_utils.dart';
import 'package:rent_hub/core/utils/toast_utils.dart';
import 'package:rent_hub/features/authentication/service/authentication_service.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/features/authentication/view/pages/login_page.dart';
import 'package:rent_hub/main.dart';

class LogOutUseCase {
  // Log out
  Future<void> call() async {
    try {
      await AuthenticationService.logout();

      // Logout successful toast
      ToastUtils.showMessage(message: "Successfully logged out");

      // Navigate to login screen
      // Ensure this path matches your router setup
      App.navigatorKey.currentContext!.push(LoginPage.routePath);
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
