import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/images/sky_circular_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SkyVerticalImageText extends StatelessWidget {
  const SkyVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = SkyColors.white,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SkySizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            SkyCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: SkySizes.sm,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: darkMode ? SkyColors.light : SkyColors.dark,
            ),

            /// Category Title
            const SizedBox(height: SkySizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
