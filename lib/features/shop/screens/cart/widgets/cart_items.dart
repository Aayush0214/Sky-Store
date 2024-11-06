import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/features/shop/controllers/product/cart_controller.dart';
import 'package:sky_store/utils/constants/colors.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/text/products_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class SkyCartItems extends StatelessWidget {
  const SkyCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        controller: ScrollController(),
        separatorBuilder: (_, __) =>
            Divider(
              color: SkyColors.grey,
              thickness: 2,
              indent: 1,
              endIndent: 8,
            ),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              /// Cart Item
              SkyCartItem(item: item),
              if (showAddRemoveButton)
                const SizedBox(height: SkySizes.spaceBtwItems),

              /// Add Remove Button Row with total Price
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        /// Extra Space
                        SizedBox(width: 70),

                        /// Add Remove Buttons
                        SkyProductQuantityWithAddRemoveButton(
                            quantity: item.quantity,
                            add: () => cartController.addOneItemToCart(item),
                            remove: () =>
                                cartController.removeOneItemFromCart(item)),
                      ],
                    ),
                    SkyProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
