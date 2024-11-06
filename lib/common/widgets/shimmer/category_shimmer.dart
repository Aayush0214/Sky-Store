import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/shimmer/skyshimmer.dart';

import '../../../utils/constants/sizes.dart';

class SkyCategoryShimmer extends StatelessWidget {
  const SkyCategoryShimmer({
    super.key,
    this.itemCount = 8,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: SkySizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              SkyShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: SkySizes.spaceBtwItems / 2),

              /// Text
              SkyShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
