import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/notification/service/notification_service.dart';

class GetFcmTokenFromDb {
  Future<DocumentSnapshot<AccountDetailsModel>> call(
      {required String id}) async {
    return await NotificationService().getFcmTokenFromDb(id: id);
  }
}
