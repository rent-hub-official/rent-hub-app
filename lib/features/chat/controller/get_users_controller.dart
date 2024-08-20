import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_hub/features/ads/domain/usecase/get_account_details_use_case.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/chat/domain/usecase/get_users_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_users_controller.g.dart';

@Riverpod(keepAlive: true)
class GetUserController extends _$GetUserController {
  @override
  List<AccountDetailsModel>? build() {
    return null;
  }

  Future<bool> updateChatUsersList([bool forceUpdate = false]) async {
    if (!forceUpdate && state != null) return true;

    final users = await GetUsersUseCase()(
        FirebaseAuth.instance.currentUser!.phoneNumber!);

    final usersList = <AccountDetailsModel>[];

    for (final user in users) {
      final userDetails = await GetAccountDetailsUseCase()(user);

      if (userDetails.userId.trim().isNotEmpty) {
        usersList.add(userDetails);
      }
    }

    state = usersList;
    return true;
  }

  /// Return the users list that matches with the search term
  Future<List<AccountDetailsModel>?> searchUsers(String searchTerm) async {
    await updateChatUsersList();

    if (searchTerm.isEmpty) {
      return state;
    }

    if (state == null) return null;

    return state
        ?.where((user) =>
            user.userName.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }
}
