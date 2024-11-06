import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/styles/shadows.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sky_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:sky_store/common/widgets/products/product_cards/add_to_cart_button.dart';
import 'package:sky_store/common/widgets/slider_images/sky_rounded_image.dart';
import 'package:sky_store/features/shop/controllers/product/product_controller.dart';
import 'package:sky_store/features/shop/models/product_model.dart';
import 'package:sky_store/features/shop/screens/product_details/product_detail.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../text/product_title_text.dart';
import '../../text/products_price_text.dart';
import '../../text/sky_brand_title_with_verified_icon.dart';

class SkyProductCardVertical extends StatelessWidget {
  const SkyProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = SkyHelperFunctions.isDarkMode(context);

    /// Container with side padding, color, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product)),
      child: Container(
        width: 180,
        height: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [SkyShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(SkySizes.productImageRadius),
          color: darkMode ? SkyColors.darkerGrey : SkyColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            SkyRoundedContainer(
              padding: const EdgeInsets.all(SkySizes.sm / 2),
              backgroundColor: darkMode ? SkyColors.dark : SkyColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Images
                  SkyRoundedImage(
                    height: 180,
                    width: 180,
                    padding: const EdgeInsets.all(5),
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
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
            const SizedBox(height: SkySizes.spaceBtwItems / 2),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: SkySizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkyProductTitleText(
                      title: product.title, smallSize: true, maxLines: 2),
                  const SizedBox(height: SkySizes.spaceBtwItems / 2),
                  SkyBrandTitleWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),
            // Todo: Add Spacer() here to keep the height of each Box same in case 1 or 2 lines of Headings
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
                              .apply(decoration: TextDecoration.lineThrough),
                        ),
                      ),

                      /// Price, show sale price as main price if sale exist.
                      Padding(
                        padding:
                            const EdgeInsets.only(left: SkySizes.sm, bottom: 5),
                        child: SkyProductPriceText(
                          price: controller.getProductPrice(product),
                          isLarge: false,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Add to cart button
                ProductCardAddToCartButton(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
