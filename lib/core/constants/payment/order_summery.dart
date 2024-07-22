import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_summery.g.dart';

class OrderSummeryConstants {
  final txtPickUpDate = "Pick up date";
  final txtDropUp = "Drop Up";
  final txtSelectLocation = "Select pick up location";
  final txtReturnLocation = "Return to the same location";
  final txtPolicyTerms = "I agree to the RentHub Privacy Policy and Terms";
  final txtBtn = "Pay";
}

@riverpod
OrderSummeryConstants orderSummery(OrderSummeryRef ref) {
  return OrderSummeryConstants();
}
