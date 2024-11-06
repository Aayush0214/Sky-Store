import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/loaders/animation_loader.dart';
import 'package:sky_store/features/shop/controllers/product/cart_controller.dart';
import 'package:sky_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:sky_store/features/shop/screens/checkout/checkout.dart';
import 'package:sky_store/navigation_menu.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: SkyAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        final emptyWidget = SkyAnimationLoaderWidget(
          text: 'Oops! Nothing added in the cart.',
          animation: SkyImages.emptyCart,
          showAction: true,
          actionText: 'Let\'s add something.',
          onActionPressed: () => Get.offAll(() => const NavigationMenu()),
        );
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const Padding(
            padding: EdgeInsets.all(SkySizes.sm),

            /// -- Items in Cart
            child: SizedBox(height: 570,child: SkyCartItems()),
          );
        }
      }),

      /// Checkout Button
      bottomNavigationBar: Obx(
          () => controller.cartItems.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(SkySizes.md),
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const CheckoutScreen()),
                    child: Text('Checkout ₹${controller.totalCartPrice.value}')),
              ),
      ),
    );
  }
}
