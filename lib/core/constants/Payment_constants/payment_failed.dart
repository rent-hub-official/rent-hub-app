import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'payment_failed.g.dart';

class PaymentFailed {
  final String txtHeading = "Payment Failed";
  final String txtSubHeading = "Your funds haven’t Transferd to the Owner";
  final String txtFailedToPay = "Failed to pay ";
  final String txtReferenceId = "Reference ID";
   final String txtPaymentMethod = "Payment method";
  final String txtBtn = "Retry";
}

@riverpod
PaymentFailed paymentFailed(PaymentFailedRef ref) {
  return PaymentFailed();
}
