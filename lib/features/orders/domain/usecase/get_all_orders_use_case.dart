import 'package:rent_hub/features/orders/domain/model/orders_model.dart';
import 'package:rent_hub/features/orders/service/orders_service.dart';

class GetAllOrdersUseCase {
  Stream<List<OrdersModel>> call() {
    return OrdersService.getAllOrders().map(
      (snapshot) => snapshot.docs
          .map(
            (doc) => doc.data(),
          )
          .toList(),
    );
  }
}
