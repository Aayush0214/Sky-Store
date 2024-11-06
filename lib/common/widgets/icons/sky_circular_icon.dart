import 'package:flutter/material.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class SkyCircularIcon extends StatelessWidget {
  const SkyCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = SkySizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.padding,
    this.margin,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : SkyHelperFunctions.isDarkMode(context)
                ? SkyColors.black.withOpacity(0.9)
                : SkyColors.white.withOpacity(0.9),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          splashColor: SkyColors.darkerGrey,
          icon: Icon(
            icon,
            color: color,
            size: size,
          ),
        ),
      ),
    );
  }
}
