import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/sky_circular_icon.dart';

class SkyProductQuantityWithAddRemoveButton extends StatelessWidget {
  const SkyProductQuantityWithAddRemoveButton({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SkyCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: SkySizes.md,
          color: SkyHelperFunctions.isDarkMode(context)
              ? SkyColors.white
              : SkyColors.black,
          backgroundColor: SkyHelperFunctions.isDarkMode(context)
              ? SkyColors.darkerGrey
              : SkyColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: SkySizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: SkySizes.spaceBtwItems),
        SkyCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: SkySizes.md,
          color: SkyColors.white,
          backgroundColor: SkyColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
