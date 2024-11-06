import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/shimmer/skyshimmer.dart';

import '../../../utils/constants/sizes.dart';

class SkyBoxesShimmer extends StatelessWidget {
  const SkyBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: SkyShimmerEffect(width: 150, height: 110)),
            SizedBox(width: SkySizes.spaceBtwItems),
            Expanded(child: SkyShimmerEffect(width: 150, height: 110)),
            SizedBox(width: SkySizes.spaceBtwItems),
            Expanded(child: SkyShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
