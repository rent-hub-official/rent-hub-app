import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';
import 'package:rent_hub/features/orders/domain/model/orders_model.dart';
import 'package:rent_hub/features/orders/domain/usecase/add_order_use_case.dart';
import 'package:rent_hub/features/orders/domain/usecase/delete_order_use_case.dart';
import 'package:rent_hub/features/orders/domain/usecase/get_all_orders_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_provider.g.dart';

@riverpod
class Orders extends _$Orders {
  Stream<List<OrdersModel?>> build() {
    return GetAllOrdersUseCase()(
        currentUser: ref.read(authenticationProvider).phoneNumber!);
  }

  void addOrder({required OrdersModel ordersModel}) {
    AddOrderUseCase()(orderModel: ordersModel);
  }

  void deleteOrder({required String adsId}) {
    DeleteOrderUseCase()(adsId: adsId);
  }
}
