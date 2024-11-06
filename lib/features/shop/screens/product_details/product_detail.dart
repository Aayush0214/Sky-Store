import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/shop/models/product_model.dart';
import 'package:sky_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:sky_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:sky_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:sky_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:sky_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:sky_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:sky_store/utils/constants/enums.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import '../../controllers/product/variation_controller.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    return Scaffold(
      bottomNavigationBar: SkyBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Product Image Slider
            TProductImageSlider(product: product),

            /// -- Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: SkySizes.defaultSpace,
                  left: SkySizes.defaultSpace,
                  bottom: SkySizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Rating & Share Button
                  const SkyRatingAndShare(),

                  /// -- Price, Title, Stock, & Brand
                  SkyProductMetaData(product: product),

                  /// -- Attributes
                  if (product.productType == ProductType.variable.toString())
                    SkyProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: SkySizes.spaceBtwSections),

                  // /// -- Checkout Button
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //       onPressed:
                  //           cartController.productQuantityInCart.value < 1
                  //               ? null
                  //               : () => Get.to(() => const CartScreen()),
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: SkyColors.primary,
                  //       ),
                  //       child: Text('Go to Cart',
                  //           style: TextStyle(color: SkyColors.white)),
                  //     ),
                  // ),
                  // const SizedBox(height: SkySizes.spaceBtwSections),

                  /// -- Description
                  const SkySectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: SkySizes.spaceBtwItems / 2),
                  Obx(
                    () => ReadMoreText(
                      controller.selectedVariation.value.id.isNotEmpty
                          ? controller.selectedVariation.value.description ?? ''
                          : product.description ?? '',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: ' Show less',
                      moreStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                  ),

                  /// -- Reviews
                  const SizedBox(height: SkySizes.spaceBtwSections / 2),
                  const Divider(),
                  const SizedBox(height: SkySizes.spaceBtwItems / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SkySectionHeading(
                          title: 'Reviews', showActionButton: false),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(Iconsax.arrow_right_3, size: 18))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
