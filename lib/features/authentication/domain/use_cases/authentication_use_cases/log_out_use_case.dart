import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/core/utils/snakbar/toaster_util.dart';
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
      ToasterUtil.showMessage(message: "Successfully logged out");

      // Navigate to login screen
      // Ensure this path matches your router setup
      MyApp.navigatorKey.currentContext!.push(LoginPage.routePath);
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
