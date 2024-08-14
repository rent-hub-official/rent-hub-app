import 'package:rent_hub/core/utils/toast_utils.dart';
import 'package:rent_hub/features/ads/domain/entity/selected_location_entity.dart';
import 'package:rent_hub/features/ads/domain/usecase/get_user_selected_location_usecase.dart';
import 'package:rent_hub/features/ads/domain/usecase/save_user_selected_location_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_saved_location_provider.g.dart';

@riverpod
class UserSavedLocation extends _$UserSavedLocation {
  @override
  SelectedLocationEntity? build() {
    return GetUserSelectedLocationUsecase()();
  }

  void saveLoction(
      {required String? mainText, required String? secondaryText}) {
    if (mainText != null || secondaryText != null) {
      SaveUserSelectedLocationUsecase()(
        SelectedLocationEntity(
          mainText: mainText ?? '',
          secondaryText: secondaryText ?? '',
        ),
      );
    } else {
      ToastUtils.showMessage(message: "Select correct location");
    }

    state = GetUserSelectedLocationUsecase()();
  }
}
