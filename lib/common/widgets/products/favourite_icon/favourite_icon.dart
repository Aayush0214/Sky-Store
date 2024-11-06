import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/utils/constants/colors.dart';

import '../../../../features/shop/controllers/product/favorites_controller.dart';
import '../../icons/sky_circular_icon.dart';

class SkyFavouriteIcon extends StatelessWidget {
  const SkyFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(() => SkyCircularIcon(
          width: 40,
          height: 40,
          margin: EdgeInsets.only(right: 4, bottom: 4),
          icon: controller.isFavourite(productId)
              ? Iconsax.heart5
              : Iconsax.heart,
          color: controller.isFavourite(productId) ? SkyColors.error : null,
          onPressed: () {
            controller.toggleFavouriteProduct(productId);
          },
        ));
  }
}
