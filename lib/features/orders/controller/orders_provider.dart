import 'package:rent_hub/features/orders/domain/model/orders_model.dart';
import 'package:rent_hub/features/orders/domain/usecase/add_order_use_case.dart';
import 'package:rent_hub/features/orders/domain/usecase/delete_order_use_case.dart';
import 'package:rent_hub/features/orders/domain/usecase/get_all_orders_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_provider.g.dart';

@riverpod
class Orders extends _$Orders {
  Stream<List<OrdersModel>> build() {
    return GetAllOrdersUseCase()();
  }

  void addOrder({required OrdersModel ordersModel}) {
    AddOrderUseCase()(orderModel: ordersModel);
  }

  void deleteOrder({required OrdersModel ordersModel}) {
    DeleteOrderUseCase()(orderModel: ordersModel);
  }
}
