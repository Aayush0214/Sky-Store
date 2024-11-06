import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/features/shop/controllers/product/cart_controller.dart';
import 'package:sky_store/features/shop/screens/cart/cart.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/colors.dart';

class SkyCartCounterIcon extends StatelessWidget {
  const SkyCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    // Get an instance of the CartController
    final controller = Get.put(CartController());

    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: counterBgColor ??
                    (darkMode ? SkyColors.white : SkyColors.black),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Obx(
                () => Text(controller.noOfCartItem.value.toString(),
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: counterTextColor ??
                            (darkMode ? SkyColors.black : SkyColors.white),
                        fontSizeFactor: 0.8)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
