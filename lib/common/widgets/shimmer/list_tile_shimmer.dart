import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/shimmer/skyshimmer.dart';
import 'package:sky_store/utils/constants/sizes.dart';

class SkyListTileShimmer extends StatelessWidget {
  const SkyListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            SkyShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: SkySizes.spaceBtwItems),
            Column(
              children: [
                SkyShimmerEffect(width: 100, height: 15),
                SizedBox(height: SkySizes.spaceBtwItems / 2),
                SkyShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
