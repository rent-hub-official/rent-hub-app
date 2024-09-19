import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';

class UpdateLastSeenUseCase {
  Future<void> call(Timestamp lastSeen) async {
    AccountDetailsService.updateLastSeen(lastSeen);
  }
}
