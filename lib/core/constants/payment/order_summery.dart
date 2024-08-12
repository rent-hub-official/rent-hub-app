import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_summery.g.dart';

class OrderSummeryConstants {
  final txtPickUpDate = "Pick up date";
  final txtDropUp = "Drop Up";
  final txtSelectLocation = "Select pick up location";
  final txtReturnLocation = "Return to the same location";
  final txtAgree = "I agree to the RentHub Privacy ";
  final txtPolicyTerms = "Policy & Terms";
  final txtBtn = "Pay";
}

@riverpod
OrderSummeryConstants orderSummery(OrderSummeryRef ref) {
  return OrderSummeryConstants();
}
