import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/core/utils/snakbar/toaster_util.dart';
import 'package:rent_hub/features/authentication/service/authentication_service.dart';

final class LogOutUseCase {
  // log out
  call() async {
    try {
      await AuthenticationService.logout();

      // logout successfull toast
      ToasterUtil.showMessage(message: "SuccessFully logout");
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
