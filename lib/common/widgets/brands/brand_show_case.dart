import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/shimmer/skyshimmer.dart';
import 'package:sky_store/features/shop/models/brand_model.dart';
import 'package:sky_store/features/shop/screens/brand/brand_products.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_cards.dart';

class SkyBrandShowcase extends StatelessWidget {
  const SkyBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: SkyRoundedContainer(
        showBorder: true,
        borderColor: SkyColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: SkySizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with Product Count
            SkyBrandCard(
              showBorder: false,
              brands: brand,
            ),

            /// Brand Top 3 Product Images
            Row(
                children: images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList()),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: SkyRoundedContainer(
        height: 100,
        backgroundColor: SkyHelperFunctions.isDarkMode(context)
            ? SkyColors.darkerGrey
            : SkyColors.light,
        margin: const EdgeInsets.all(SkySizes.sm),
        padding: const EdgeInsets.all(SkySizes.md),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const SkyShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
