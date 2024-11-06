import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/icons/sky_circular_icon.dart';
import 'package:sky_store/features/shop/controllers/product/cart_controller.dart';
import 'package:sky_store/features/shop/models/product_model.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class SkyBottomAddToCart extends StatelessWidget {
  const SkyBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProductCount(product);
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: SkySizes.defaultSpace,
          vertical: SkySizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: darkMode ? SkyColors.darkerGrey : SkyColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(SkySizes.cardRadiusLg),
          topRight: Radius.circular(SkySizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SkyCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: SkyColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: SkyColors.white,
                  onPressed: () =>
                      cartController.productQuantityInCart.value < 1
                          ? null
                          : cartController.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: SkySizes.spaceBtwItems),
                Text(cartController.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: SkySizes.spaceBtwItems),
                SkyCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: SkyColors.black,
                  width: 40,
                  height: 40,
                  color: SkyColors.white,
                  onPressed: () =>
                      cartController.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: cartController.productQuantityInCart.value < 1
                  ? null
                  : () => cartController.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(SkySizes.md),
                backgroundColor: SkyColors.black,
                side: const BorderSide(color: SkyColors.black),
              ),
              child: Text('Add to Cart', style: TextStyle(color: cartController.productQuantityInCart.value < 1 ? Colors.black45 : SkyColors.white)),
            )
          ],
        ),
      ),
    );
  }
}
