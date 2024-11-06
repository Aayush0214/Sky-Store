import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/success_screen/success_screen.dart';
import 'package:sky_store/data/repositories/authentication/authentication_repository.dart';
import 'package:sky_store/features/personalization/controllers/address_controller.dart';
import 'package:sky_store/features/shop/controllers/product/cart_controller.dart';
import 'package:sky_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:sky_store/navigation_menu.dart';
import 'package:sky_store/utils/constants/enums.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/popups/full_screen_loader.dart';
import 'package:sky_store/utils/popups/loaders.dart';

import '../../../../data/repositories/order/order_repository.dart';
import '../../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckOutController.instance;
  RxInt orderStatusIndex = 0.obs;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrder = await orderRepository.fetchUserOrders();
      return userOrder;
    } catch (e) {
      SkyLoaders.warningSnackBar(
          title: 'What Happened?', message: e.toString());
      return [];
    }
  }

  /// Fetch specific order status
  int fetchOrderStatus(OrderModel order) {
    if (order.status.toString() == 'OrderStatus.pending') {
      return 0;
    } else if (order.status.toString() == 'OrderStatus.processing') {
      return  1;
    } else if (order.status.toString() == 'OrderStatus.shipped') {
      return  2;
    } else if (order.status.toString() == 'OrderStatus.delivered') {
      return  3;
    } else {
      return 4;
    }
  }

  /// Add methods for order processing
  void processOrder(double subtotal, double shippingCost, double tax,
      double totalAmount) async {
    try {
      // Start Loader
      SkyFullScreenLoader.openLoadingDialog(
          'We are processing your order', SkyImages.securePayment);

      // Get user authentication id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add details
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        subtotal: subtotal,
        shippingCost: shippingCost,
        tax: tax,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        paymentIcon: checkoutController.selectedPaymentMethod.value.image,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now().add(Duration(days: 5)),
        item: cartController.cartItems.toList(),
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();

      // show success screen
      Get.offAll(() =>
          SuccessScreen(
              image: SkyImages.paymentSuccessful,
              title: 'Order Placed',
              subTitle: 'Your item will be shipped soon',
              onPressed: () => Get.offAll(() => const NavigationMenu())));
    } catch (e) {
      SkyLoaders.errorSnackBar(title: 'What Happened?', message: e.toString());
    }
  }
}
