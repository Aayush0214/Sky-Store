import 'package:flutter/material.dart';
import 'package:sky_store/features/shop/models/cart_item_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../slider_images/sky_rounded_image.dart';
import '../../text/product_title_text.dart';
import '../../text/sky_brand_title_with_verified_icon.dart';

class SkyCartItem extends StatelessWidget {
  const SkyCartItem({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        SkyRoundedImage(
          imageUrl: item.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(SkySizes.sm),
          backgroundColor: SkyHelperFunctions.isDarkMode(context)
              ? SkyColors.darkerGrey
              : SkyColors.light,
        ),
        const SizedBox(width: SkySizes.spaceBtwItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SkyBrandTitleWithVerifiedIcon(
                  title: item.brandName ?? ''),
              Flexible(
                child: SkyProductTitleText(title: item.title, maxLines: 2),
              ),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: (item.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(
                                text: e.key,
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(text: ': '),
                            TextSpan(
                                text: e.value,
                                style: Theme.of(context).textTheme.bodyLarge),
                            TextSpan(text: ' '),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
