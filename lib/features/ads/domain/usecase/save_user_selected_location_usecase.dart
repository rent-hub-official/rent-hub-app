import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/features/ads/domain/entity/selected_location_entity.dart';
import 'package:rent_hub/features/ads/service/location_service.dart';
import 'package:rent_hub/main.dart';

final class SaveUserSelectedLocationUsecase {
  call(SelectedLocationEntity location) {
    try {
      LocationService.saveUserSelectedLocation(location);

      App.navigatorKey.currentContext?.pop();
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
  }
}
