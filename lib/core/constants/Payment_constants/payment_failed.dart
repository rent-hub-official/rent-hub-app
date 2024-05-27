import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'payment_failed.g.dart';

class PaymentFailed {
  final txtHeading = "Payment Failed";
  final txtSubHeading = "Your funds haven’t Transferd to the Owner";
  final txtFailedToPay = "Failed to pay ";
  final txtReferenceId = "Reference ID";
  final txtPaymentMethod = "Payment method";
  final txtBtn = "Retry";
  final exclamationicon = "Retry";
}

@riverpod
PaymentFailed paymentFailed(PaymentFailedRef ref) {
  return PaymentFailed();
}
