import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snackbar_utils.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';
import 'package:rent_hub/features/authentication/view/pages/login_page.dart';
import 'package:rent_hub/main.dart';

class DeleteAccountUseCase {
  call() async {
    try {
      await AccountDetailsService.deleteAccount();

      // navigate to home page
      App.navigatorKey.currentContext!.go(LoginPage.routePath);
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
