import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'last_seen_controller.g.dart';

@riverpod
Stream<AccountDetailsModel> lastSeen(LastSeenRef ref, String userId) async* {
  final userDetailsStream = AccountDetailsService.getUserDetails(userId);

  await for (final userDetails in userDetailsStream) {
    yield userDetails.data()!;
  }
}
