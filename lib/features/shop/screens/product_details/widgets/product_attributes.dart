import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sky_store/common/widgets/text/product_title_text.dart';
import 'package:sky_store/common/widgets/text/products_price_text.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/shop/controllers/product/variation_controller.dart';
import 'package:sky_store/features/shop/models/product_model.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class SkyProductAttributes extends StatelessWidget {
  const SkyProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          /// -- Selected Attribute Pricing & Description
          // Display variation price and stock when same variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
            SkyRoundedContainer(
              padding: const EdgeInsets.all(SkySizes.md),
              backgroundColor: darkMode ? SkyColors.darkerGrey : SkyColors.grey,
              child: Column(
                children: [
                  /// Title, Price and Stock Status
                  const SkySectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: SkySizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SkyProductTitleText(
                              title: 'Price :  ', smallSize: true),

                          /// Actual Price
                          Text('₹${controller.selectedVariation.value.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: SkySizes.spaceBtwItems / 2),

                          /// Sale Price
                          SkyProductPriceText(
                              price: controller.getVariationPrice()),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const SkyProductTitleText(
                              title: 'Stock :  ', smallSize: true),
                          Text(controller.variationStockStatus.value,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),

                  /// Variation Description
                  SkyProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(height: SkySizes.spaceBtwItems),

          /// -- Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkySectionHeading(
                            title: attribute.name ?? '',
                            showActionButton: false),
                        const SizedBox(height: SkySizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = controller
                                    .getAttributesAvailabilityInVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);
                                return SkyChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList()),
                        ),
                        const SizedBox(height: SkySizes.spaceBtwItems / 2),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
