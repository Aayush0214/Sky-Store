import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sky_store/common/widgets/images/sky_circular_image.dart';
import 'package:sky_store/common/widgets/text/product_title_text.dart';
import 'package:sky_store/common/widgets/text/products_price_text.dart';
import 'package:sky_store/common/widgets/text/sky_brand_title_with_verified_icon.dart';
import 'package:sky_store/features/shop/controllers/product/product_controller.dart';
import 'package:sky_store/features/shop/models/product_model.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/enums.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../controllers/product/variation_controller.dart';

class SkyProductMetaData extends StatelessWidget {
  const SkyProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final controller2 = Get.put(VariationController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            SkyRoundedContainer(
              radius: SkySizes.sm,
              backgroundColor: SkyColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: SkySizes.sm, vertical: SkySizes.xs),
              child: Text('$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: SkyColors.black)),
            ),
            const SizedBox(width: SkySizes.spaceBtwItems),

            /// Price
            Obx(
              () => Text(
                  controller2.selectedVariation.value.id.isNotEmpty
                      ? '₹${controller2.selectedVariation.value.price}'
                      : '₹${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            ),
            const SizedBox(width: SkySizes.spaceBtwItems / 2),
            Obx(
              () => SkyProductPriceText(
                price: controller2.selectedVariation.value.id.isNotEmpty
                    ? controller2.getVariationPrice()
                    : controller.getProductPrice(product),
                isLarge: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: SkySizes.spaceBtwItems / 1.5),

        /// Title
        SkyProductTitleText(title: product.title, maxLines: 5),
        const SizedBox(height: SkySizes.spaceBtwItems / 2),

        /// Stock Status
        Row(
          children: [
            const SkyProductTitleText(title: 'Status: '),
            Text(
                controller2.selectedVariation.value.id.isNotEmpty
                    ? controller2.variationStockStatus.value
                    : controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: SkySizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            SkyCircularImage(
                image: product.brand != null ? product.brand!.image : '',
                width: 40,
                height: 40,
                overlayColor: darkMode ? SkyColors.white : SkyColors.black),
            const SizedBox(width: SkySizes.spaceBtwItems / 4),
            SkyBrandTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSizes.medium),
          ],
        ),
        const SizedBox(height: SkySizes.spaceBtwItems / 2),
      ],
    );
  }
}
