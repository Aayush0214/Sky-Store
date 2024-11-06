import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/features/shop/controllers/all_product_controller.dart';
import 'package:sky_store/features/shop/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class SkySortableProducts extends StatelessWidget {
  const SkySortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort products based on the selected option
            controller.sortProducts(value!);
          },
          items: const [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Popularity',
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: SkySizes.spaceBtwSections),

        /// Products
        Obx(
          () => SkyGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) =>
                  SkyProductCardVertical(product: controller.products[index])),
        )
      ],
    );
  }
}
