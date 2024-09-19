import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details_model.g.dart';
part 'account_details_model.freezed.dart';

// Create a custom JsonConverter for Firestore's Timestamp
class TimestampConverter implements JsonConverter<Timestamp, dynamic> {
  const TimestampConverter();

  @override
  Timestamp fromJson(dynamic json) {
    if (json is Timestamp) {
      return json;
    } else if (json is Map<String, dynamic>) {
      return Timestamp(json['seconds'], json['nanoseconds']);
    } else if (json is int) {
      return Timestamp.fromMillisecondsSinceEpoch(json);
    }
    throw Exception('Cannot convert $json to Timestamp');
  }

  @override
  dynamic toJson(Timestamp object) {
    return object;
  }
}

@freezed
class AccountDetailsModel with _$AccountDetailsModel {
  factory AccountDetailsModel({
    required String userName,
    required String profileImage,
    required String userId,
    @TimestampConverter() required Timestamp lastSeen,
    String? fcmToken,
  }) = _AccountDetailsModel;

  factory AccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsModelFromJson(json);

  factory AccountDetailsModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final dataMap = snapshot.data()!;
    dataMap['userId'] = snapshot.id;

    return AccountDetailsModel.fromJson(dataMap);
  }

  static Map<String, dynamic> toFirestore(
      AccountDetailsModel accountModel, SetOptions? options) {
    final json = accountModel.toJson();
    json.remove(
        'userId'); // Remove if you don't want to send userId to Firestore
    return json;
  }
}
