import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details_model.g.dart';
part 'account_details_model.freezed.dart';

@freezed
class AccountDetailsModel with _$AccountDetailsModel {
  const factory AccountDetailsModel({
    required String userName,
    required String profileImage,
    required String userId,
    String? fcmToken,
  }) = _AccountDetailsModel;

  factory AccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsModelFromJson(json);

  factory AccountDetailsModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    data!['userId'] = snapshot.id;

    return AccountDetailsModel.fromJson(data);
  }

  static Map<String, dynamic> toFirestore(
      AccountDetailsModel contact, SetOptions? options) {
    final json = contact.toJson();
    json.remove('userId');
    return json;
  }
}
