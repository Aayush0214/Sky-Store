import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sky_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(SkyImages.userProfileImage2)),
                const SizedBox(width: SkySizes.spaceBtwItems),
                Text('John Richard',
                    style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: SkySizes.spaceBtwItems / 4),

        /// Review
        Row(
          children: [
            const SkyRatingBarIndicator(rating: 4),
            const SizedBox(width: SkySizes.spaceBtwItems),
            Text('26 Aug, 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SkySizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive, I was able to navigate and make purchase seamlessly. Great job! ',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SkyColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SkyColors.primary),
        ),
        const SizedBox(height: SkySizes.spaceBtwItems),

        ///
        SkyRoundedContainer(
          backgroundColor: darkMode ? SkyColors.darkerGrey : SkyColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(SkySizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sky Store',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('26 Aug, 2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: SkySizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive, I was able to navigate and make purchase seamlessly. Great job! ',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'Show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: SkyColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: SkyColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: SkySizes.spaceBtwSections),
      ],
    );
  }
}
