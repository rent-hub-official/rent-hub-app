import 'package:rent_hub/features/payment/domain/use_case/payment_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_controller.g.dart';

@riverpod
void payment(PaymentRef ref, {required int amount}) {
  return PaymentUseCase()(amount);
}
