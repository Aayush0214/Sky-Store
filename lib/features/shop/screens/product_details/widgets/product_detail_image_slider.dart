import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:sky_store/features/shop/controllers/product/images_controller.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/slider_images/sky_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return SkyCurvedEdgeWidget(
      child: Container(
        color: darkMode ? SkyColors.darkerGrey : SkyColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(SkySizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: SkyColors.primary),
                      ),
                    );
                  }),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: SkySizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return SkyRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      backgroundColor:
                          darkMode ? SkyColors.dark : SkyColors.white,
                      border: Border.all(
                          color: imageSelected
                              ? SkyColors.primary
                              : Colors.transparent),
                      padding: const EdgeInsets.all(SkySizes.sm),
                      imageUrl: images[index],
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                    );
                  }),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: SkySizes.spaceBtwItems),
                ),
              ),
            ),

            /// -- AppBar Icons
            SkyAppBar(
              showBackArrow: true,
              actions: [
                SkyFavouriteIcon(productId: product.id),
              ],
            )
          ],
        ),
      ),
    );
  }
}
