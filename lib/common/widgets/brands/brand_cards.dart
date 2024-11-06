import 'package:flutter/material.dart';
import 'package:sky_store/features/shop/models/brand_model.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/sky_circular_image.dart';
import '../text/sky_brand_title_with_verified_icon.dart';

class SkyBrandCard extends StatelessWidget {
  const SkyBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
    required this.brands,
  });

  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brands;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = SkyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: SkyRoundedContainer(
        padding: const EdgeInsets.all(SkySizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Icon
            Flexible(
              child: SkyCircularImage(
                image: brands.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlayColor: isDarkMode ? SkyColors.white : SkyColors.black,
              ),
            ),
            const SizedBox(width: SkySizes.spaceBtwItems / 2),

            /// -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkyBrandTitleWithVerifiedIcon(
                    title: brands.name,
                    brandTextSize: TextSizes.medium,
                  ),
                  Text(
                    '${brands.productsCount ?? 0} Products',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                    style: Theme.of(context).textTheme.labelMedium,
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
