import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchase_history.g.dart';

class PurchaseHistoryConstants {
  final txtHeading = "Purchase History";
  final txtBookingHistory = "Order History";
  final txtOngoingOrders = "Ongoing Orders";
  final txtCompletedOrders = "Completed Orders";
  final txtOrderplaced = "Order placed";
  final txtPaymentSuccessful = "Payment Successful";
  final txtOrderconfirmed = "Order confirmed by the Owner";
  final txtSuccessful = "Service Successful";
  final txtOR = "OR";
  final txtsubHeading =
      "you can’t cancel service after shares the unique code to the seller";
  final txtBtn = "Cancel";
  final txtPending = 'Pending';
  final txtCompleted = 'Completed';
  final txtRejected = 'Rejected';
}

@riverpod
PurchaseHistoryConstants purchaseHistoryConstants(
    PurchaseHistoryConstantsRef ref) {
  return PurchaseHistoryConstants();
}
