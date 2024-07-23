import 'package:rent_hub/features/orders/service/orders_service.dart';

class DeleteOrderUseCase {
  void call({required String adsId}) async {
    // Delete order
    await OrdersService.deleteOrder(adsId);
  }
}