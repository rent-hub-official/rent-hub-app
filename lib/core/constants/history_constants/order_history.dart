import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_history.g.dart';
class OrderHistory {
  final  txtHeading = "Booking History";
  final  txtPendingOrder = "Pending Order";
  final  txtCompletedOrder = "Completed Order";
  final  txtAccept = "Accept";
  final  txRejectt = "Reject";
  final  txtEnterCode = "Enter the unique code";
  final  txtConfirm = "Confirm";
}

@riverpod
OrderHistory orderHistory(OrderHistoryRef ref) {
  return OrderHistory();
}
