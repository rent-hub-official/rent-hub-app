import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_history.g.dart';

class OrderHistoryConstants {
  final txtHeading = "Booking History";
  final txtPendingOrder = "Pending Order";
  final txtCompletedOrder = "Completed Order";
  final txtAccept = "Accept";
  final txtReject = "Reject";
  final txtEnterCode = "Enter the unique code";
  final txtConfirm = "Confirm";
}

@riverpod
OrderHistoryConstants orderHistoryConstants(OrderHistoryConstantsRef ref) {
  return OrderHistoryConstants();
}
