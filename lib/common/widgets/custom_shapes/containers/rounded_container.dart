import 'package:flutter/material.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/sizes.dart';

class SkyRoundedContainer extends StatelessWidget {
  const SkyRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.margin,
    this.showBorder = false,
    this.radius = SkySizes.cardRadiusLg,
    this.backgroundColor = SkyColors.white,
    this.borderColor = SkyColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
