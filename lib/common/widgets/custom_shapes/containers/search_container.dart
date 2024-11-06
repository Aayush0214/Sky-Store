import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SkySearchContainer extends StatelessWidget {
  const SkySearchContainer({
    super.key,
    required this.text,
    this.icon,
    required this.showBackground,
    required this.showBorder,
    this.onTap,
    this.padding =
        const EdgeInsets.symmetric(horizontal: SkySizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: SkyDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(SkySizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? darkMode
                    ? SkyColors.dark
                    : SkyColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(SkySizes.cardRadiusLg),
            border: showBorder ? Border.all(color: SkyColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon,
                  color: darkMode ? SkyColors.light : SkyColors.darkerGrey),
              const SizedBox(width: SkySizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall!),
            ],
          ),
        ),
      ),
    );
  }
}
