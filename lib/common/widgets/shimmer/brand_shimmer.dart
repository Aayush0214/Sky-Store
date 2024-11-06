import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/layouts/grid_layout.dart';
import 'package:sky_store/common/widgets/shimmer/skyshimmer.dart';

class SkyBrandShimmer extends StatelessWidget {
  const SkyBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SkyGridLayout(
      itemCount: itemCount,
      mainAxisExtent: 80,
      itemBuilder: (_, __) => const SkyShimmerEffect(width: 300, height: 80),
    );
  }
}
