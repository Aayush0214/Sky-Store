import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/shimmer/skyshimmer.dart';
import 'package:sky_store/utils/constants/sizes.dart';

class SkyHorizontalProductShimmer extends StatelessWidget {
  const SkyHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: SkySizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            const SizedBox(width: SkySizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            SkyShimmerEffect(width: 120, height: 120),
            SizedBox(width: SkySizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: SkySizes.spaceBtwItems / 2),
                SkyShimmerEffect(width: 160, height: 15),
                SizedBox(height: SkySizes.spaceBtwItems / 2),
                SkyShimmerEffect(width: 110, height: 15),
                SizedBox(height: SkySizes.spaceBtwItems / 2),
                SkyShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
