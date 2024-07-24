import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/features/payment/service/payment_service.dart';

class PaymentUseCase {
  void call(int amount) {
    try {
      // This is a dummy method to simulate payment
      PaymentService().doPayment(amount);
    } catch (e) {
      SnackbarUtils.showError('Payment failed');
    }
  }
}
