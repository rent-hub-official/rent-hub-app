import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/account_details/account_details_model.dart';
import 'package:rent_hub/features/ads/service/user_details_service.dart';

final class GetAccountDetailsUseCase {
  Future<AccountDetailsModel> call(String userId) async {
    try {
      final user = await UserDetailsService.getData(userId);
      return user.data()!;
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
