import 'package:flutter/material.dart';
import 'package:sky_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class SkyOverallProductRating extends StatelessWidget {
  const SkyOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 6,
          child: Column(
            children: [
              SkyRatingProgressIndicator(text: '5', value: 1),
              SkyRatingProgressIndicator(text: '4', value: 0.8),
              SkyRatingProgressIndicator(text: '3', value: 0.6),
              SkyRatingProgressIndicator(text: '2', value: 0.4),
              SkyRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
