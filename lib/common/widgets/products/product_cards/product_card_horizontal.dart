import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sky_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:sky_store/common/widgets/slider_images/sky_rounded_image.dart';
import 'package:sky_store/common/widgets/text/product_title_text.dart';
import 'package:sky_store/common/widgets/text/products_price_text.dart';
import 'package:sky_store/common/widgets/text/sky_brand_title_with_verified_icon.dart';
import 'package:sky_store/features/shop/controllers/product/product_controller.dart';
import 'package:sky_store/features/shop/models/product_model.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SkyProductCardHorizontal extends StatelessWidget {
  const SkyProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

    /// Container with side padding, color, edges, radius and shadow
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SkySizes.productImageRadius),
        color: darkMode ? SkyColors.darkerGrey : SkyColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          SkyRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(SkySizes.sm),
            backgroundColor: darkMode ? SkyColors.dark : SkyColors.white,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: SkyRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true),
                ),

                /// -- Sale tag
                if (salePercentage != null)
                  Positioned(
                    top: 8,
                    left: 5,
                    child: SkyRoundedContainer(
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
                  ),

                /// -- Favorite Icon button
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SkyFavouriteIcon(productId: product.id),
                ),
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: SkySizes.sm, left: SkySizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkyProductTitleText(
                        title: product.title,
                        smallSize: true,
                        maxLines: 2,
                      ),
                      SizedBox(height: SkySizes.spaceBtwItems / 2),
                      SkyBrandTitleWithVerifiedIcon(title: product.brand!.name)
                    ],
                  ),
                  const Spacer(),

                  /// -- Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// -- Price
                      Flexible(
                        child: Column(
                          children: [
                            /*if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0) */
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                '₹${product.price.toString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                            ),

                            /// Price, show sale price as main price if sale exist.
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: SkySizes.sm, bottom: 5),
                              child: SkyProductPriceText(
                                price: controller.getProductPrice(product),
                                isLarge: false,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Add to cart button
                      Container(
                        decoration: const BoxDecoration(
                          color: SkyColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(SkySizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(SkySizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: SkySizes.iconLg * 1.2,
                          height: SkySizes.iconLg * 1.2,
                          child: Center(
                              child: Icon(Iconsax.add, color: SkyColors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
