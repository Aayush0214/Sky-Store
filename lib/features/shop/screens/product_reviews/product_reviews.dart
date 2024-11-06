import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:sky_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:sky_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: const SkyAppBar(
          title: Text('Reviews & Ratings'), showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: SkySizes.spaceBtwItems),

              /// Overall Product Ratings
              const SkyOverallProductRating(),
              const SkyRatingBarIndicator(rating: 3.6),
              Text('15,608', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SkySizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
