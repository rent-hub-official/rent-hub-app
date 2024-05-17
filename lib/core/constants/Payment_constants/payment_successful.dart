import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'payment_successful.g.dart';

class PaymentSuccessful {
  final String txtHeading = "Payment Successful";
  final String txtSubHeading = "Your funds has Transferd to the Owner";
  final String txtSuccessfulPaid = "Successfully paid to";
  final String txtReferenceId = "Reference ID";
  final String txtPaymentMethod = "Payment method";

  final String txtBtn = "Back to Homepage";
}

@riverpod
PaymentSuccessful paymentSuccessful(PaymentSuccessfulRef ref) {
  return PaymentSuccessful();
}
