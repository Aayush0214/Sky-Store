import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/slider_images/sky_rounded_image.dart';
import 'package:sky_store/features/shop/models/order_model.dart';
import 'package:sky_store/utils/constants/colors.dart';

import '../../../../../common/widgets/text/product_title_text.dart';
import '../../../../../utils/constants/sizes.dart';

class OrderedItemList extends StatelessWidget {
  const OrderedItemList({super.key, required this.orderedItemsList});

  final OrderModel orderedItemsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: orderedItemsList.item.length,
        separatorBuilder: (_, index) => Divider(height: 25),
        itemBuilder: (_, index) => Column(
              children: [
                /// 1st row, item image, item title
                Row(
                  children: [
                    /// Item Image
                    Expanded(
                      flex: 0,
                      child: SkyRoundedImage(
                        imageUrl: orderedItemsList.item[index].image!,
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(3),
                        isNetworkImage: true,
                        border: Border.all(
                          color: SkyColors.grey,
                          width: 1,
                        ),
                        borderRadius: 10,
                      ),
                    ),

                    SizedBox(width: SkySizes.sm),

                    Expanded(
                        flex: 5,
                        child: SkyProductTitleText(
                          title: orderedItemsList.item[index].title,
                          maxLines: 2,
                        )),
                  ],
                ),
                const SizedBox(height: SkySizes.sm),

                /// 2nd row, item quantity, item price
                Row(
                  children: [
                    Expanded(
                        flex: 0,
                        child: Text("Quantity: ",
                            style: Theme.of(context).textTheme.labelMedium)),
                    Expanded(
                        flex: 4,
                        child: Text(
                            orderedItemsList.item[index].quantity.toString(),
                            style: Theme.of(context).textTheme.bodyLarge)),
                    Expanded(
                        flex: 2,
                        child: Text("Price: ",
                            style: Theme.of(context).textTheme.labelMedium)),
                    Expanded(
                        flex: 3,
                        child: Text(
                            orderedItemsList.item[index].price.toString(),
                            style: Theme.of(context).textTheme.headlineSmall)),
                  ],
                ),

                if (orderedItemsList.item[index].selectedVariation != null)
                  for (var itemVariation
                      in orderedItemsList.item[index].selectedVariation!.entries)
                    Row(
                      children: [
                        Text('${itemVariation.key}: ', style: Theme.of(context).textTheme.labelMedium),
                        Text(itemVariation.value, style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    )
              ],
            ));
  }
}
