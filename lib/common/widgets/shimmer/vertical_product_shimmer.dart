import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/layouts/grid_layout.dart';
import 'package:sky_store/common/widgets/shimmer/skyshimmer.dart';

import '../../../utils/constants/sizes.dart';

class SkyVerticalProductShimmer extends StatelessWidget {
  const SkyVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SkyGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            SkyShimmerEffect(width: 180, height: 180),
            SizedBox(height: SkySizes.spaceBtwItems),

            // Text
            SkyShimmerEffect(width: 160, height: 15),
            SizedBox(height: SkySizes.spaceBtwItems / 2),
            SkyShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
