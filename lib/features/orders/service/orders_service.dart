import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/orders/domain/model/orders_model.dart';

class OrdersService {
  static final ordersDb =
      FirebaseFirestore.instance.collection('orders').withConverter(
            fromFirestore: OrdersModel.fromFirestore,
            toFirestore: OrdersModel.toFireStore,
          );

  static Stream<QuerySnapshot<OrdersModel>> getAllOrders() {
    return ordersDb.snapshots();
  }

  static Future<void> putOrder(
    OrdersModel ordersModel,
  ) async {
    await ordersDb.doc(ordersModel.adsId).set(ordersModel);
  }

  static Future<void> deleteOrder(
    String adsId,
  ) async {
    await ordersDb.doc(adsId).delete();
  }
}
