import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:sky_store/common/widgets/shimmer/skyshimmer.dart';
import 'package:sky_store/features/shop/controllers/banner_controller.dart';
import '../../../../../common/widgets/slider_images/sky_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      // Shimmer Effect
      if (controller.isLoading.value) {
        return const SkyShimmerEffect(width: 250, height: 200);
      }
      if (controller.allBanners.isEmpty) {
        return const Center(child: Text('No Data Found!'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1.2,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
              items: controller.allBanners
                  .map(
                    (banner) => SkyRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: SkySizes.spaceBtwItems),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.allBanners.length; i++)
                      SkyCircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? SkyColors.primary
                                : SkyColors.grey,
                      )
                  ],
                ))
          ],
        );
      }
    });
  }
}
