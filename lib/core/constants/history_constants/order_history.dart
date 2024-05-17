import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_history.g.dart';
class OrderHistory {
  final String txtHeading = "Booking History";
  final String txtPendingOrder = "Pending Order";
  final String txtCompletedOrder = "Completed Order";
  final String txtAccept = "Accept";
  final String txRejectt = "Reject";
  final String txtEnterCode = "Enter the unique code";
  final String txtConfirm = "Confirm";
}

@riverpod
OrderHistory orderHistory(OrderHistoryRef ref) {
  return OrderHistory();
}
