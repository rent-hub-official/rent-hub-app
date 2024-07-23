import 'package:rent_hub/features/orders/domain/model/orders_model.dart';
import 'package:rent_hub/features/orders/service/orders_service.dart';

class AddOrderUseCase {
  void call({required OrdersModel orderModel}) async {
    // Add order
    await OrdersService.putOrder(orderModel);
  }
}
