import 'package:rent_hub/features/orders/domain/model/orders_model.dart';
import 'package:rent_hub/features/orders/service/orders_service.dart';

class DeleteOrderUseCase {
  void call({required OrdersModel orderModel}) async {
    // Delete order
    await OrdersService.deleteOrder(orderModel);
  }
}