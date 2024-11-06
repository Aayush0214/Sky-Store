import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/layouts/grid_layout.dart';
import 'package:sky_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:sky_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/shop/controllers/category_controller.dart';
import 'package:sky_store/features/shop/models/category_model.dart';
import 'package:sky_store/features/shop/screens/all_product/all_products.dart';
import 'package:sky_store/features/shop/screens/store/widgets/category_brands.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_function.dart';

class SkyCategoryTab extends StatelessWidget {
  const SkyCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(SkySizes.defaultSpace),
            child: Column(
              children: [
                /// -- Brands
                CategoryBrands(category: category),

                /// -- Products
                FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {
                      final response =
                          SkyCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: const SkyVerticalProductShimmer());
                      if (response != null) return response;

                      /// Record Found!
                      final products = snapshot.data!;

                      return Column(
                        children: [
                          SkySectionHeading(
                            title: 'You might like',
                            onPressed: () => Get.to(AllProducts(
                                title: category.name,
                                futureMethod: controller.getCategoryProducts(
                                    categoryId: category.id, limit: -1))),
                          ),
                          const SizedBox(height: SkySizes.spaceBtwItems),
                          SkyGridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => SkyProductCardVertical(
                                  product: products[index])),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ]);
  }
}
