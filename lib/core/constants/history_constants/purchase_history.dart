import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'purchase_history.g.dart';
class PurchaseHistory {
  final String txtHeading = "Purchase History";
  final String txtOngoingOrders = "Ongoing Orders";
  final String txtCompletedOrders = "Completed Orders";
  final String txtOrderplaced = "Order placed";
  final String txtPaymentSuccessful = "Payment Successful";
  final String txtOrderconfirmed = "Order confirmed by the Owner";
  final String txtSuccessful = "Service Successful";
  final String txtOR = "OR";
  final String txtsubHeading =
      "you can’t cancel service after shares the unique code to the seller";
  final String txtBtn = "Cancel";
}

@riverpod
PurchaseHistory purchaseHistory(PurchaseHistoryRef ref) {
  return PurchaseHistory();
}
