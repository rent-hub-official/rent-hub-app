import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_model.freezed.dart';
part 'orders_model.g.dart';

@freezed
class OrdersModel with _$OrdersModel {
  factory OrdersModel({
    required String adsId,
    required String userId,
    required DateTime orderPlacedOn,
    required DateTime paymentCompletedOn,
    required DateTime orderConfirmedOn,
    required DateTime orderCompletedOn,
    required String status,
    required String verificationCode,
  }) = _OrdersModel;

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);

  factory OrdersModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return OrdersModel.fromJson(data!);
  }

  static Map<String, dynamic> toFireStore(
      OrdersModel ordersModel, SetOptions? options) {
    return ordersModel.toJson();
  }
}
