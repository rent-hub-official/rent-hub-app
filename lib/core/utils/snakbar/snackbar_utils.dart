import 'package:rent_hub/core/widgets/error_snackbar.dart';
import 'package:rent_hub/main.dart';

class SnackbarUtils {
  /// Show a message as a snackbar
  ///
  /// [message] Is the message to be shown to the user
  static void showError(String message) {
    App.scaffoldMessngerKey.currentState!
        .showSnackBar(ErrorSnackBar(errorMessage: message));
  }
}
