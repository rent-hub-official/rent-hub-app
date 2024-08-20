import 'dart:async';

import 'package:rent_hub/features/ads/domain/usecase/get_account_details_use_case.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/chat/domain/usecase/get_users_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_users_controller.g.dart';

@riverpod
class GetUserController extends _$GetUserController {
  @override
  void build() {
    return null;
  }

  Future<List<AccountDetailsModel?>> getUser(String userId) async {
    final users = await GetUsersUseCase()(userId);

    final usersList = <AccountDetailsModel>[];

    for (final user in users) {
      final userDetails = await GetAccountDetailsUseCase()(user);

      if (userDetails.userId.trim().isNotEmpty) {
        usersList.add(userDetails);
      }
    }

    return usersList;
  }
}
