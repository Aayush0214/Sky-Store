import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sky_store/data/repositories/authentication/authentication_repository.dart';

import '../../../features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  // Fetch User's All Order History
  Future<List<OrderModel>> fetchUserOrders() async {
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw 'Unable to find user information. Try again later.';

      final result = await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((document) => OrderModel.fromSnapshot(document)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching order information. Try again later.';
    }
  }

  // Save User's order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving order information. Try again later.';
    }
  }
}