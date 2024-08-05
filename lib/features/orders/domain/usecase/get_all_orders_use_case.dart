import 'package:rent_hub/features/orders/domain/model/orders_model.dart';
import 'package:rent_hub/features/orders/service/orders_service.dart';

class GetAllOrdersUseCase {
  Stream<List<OrdersModel?>> call({required String currentUser}) {
    return OrdersService.getAllOrders().map(
      (snapshot) => snapshot.docs.map(
        (doc) {
          if (doc.data().userId == currentUser) {
            return doc.data();
          }
          return null;
        },
      ).toList(),
    );
  }
}
