import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_successful.g.dart';

class PaymentSuccessful {
  final txtHeading = "Payment Successful";
  final txtSubHeading = "Your funds has Transferd to the Owner";
  final txtSuccessfulPaid = "Successfully paid to";
  final txtReferenceId = "Reference ID";
  final txtPaymentMethod = "Payment method";

  final txtBtn = "Back to Homepage";
}

@riverpod
PaymentSuccessful paymentSuccessful(PaymentSuccessfulRef ref) {
  return PaymentSuccessful();
}
