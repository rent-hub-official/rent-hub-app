import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snackbar_utils.dart';
import 'package:rent_hub/features/navigation/view/pages/navigation_page.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';
import 'package:rent_hub/main.dart';

//add user details
final class AddAccountDeatailsUseCase {
  call({
    required AccountDetailsModel accountDetails,
  }) async {
    try {
      await AccountDetailsService.addData(
        accountDetails: accountDetails,
      );

      // navigate to home page
      App.navigatorKey.currentContext!.go(NavigationPage.routePath);
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
