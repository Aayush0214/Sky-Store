import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:sky_store/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:sky_store/common/widgets/slider_images/sky_rounded_image.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/shop/controllers/category_controller.dart';
import 'package:sky_store/features/shop/models/category_model.dart';
import 'package:sky_store/features/shop/screens/all_product/all_products.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/cloud_helper_function.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: SkyAppBar(
        showBackArrow: true,
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              SkyRoundedImage(
                width: double.infinity,
                height: null,
                imageUrl: SkyImages.banner1,
                applyImageRadius: true,
              ),
              const SizedBox(height: SkySizes.spaceBtwSections),

              /// Sub - Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  /// Handle loader, No record, Or Error Message
                  const loader = SkyHorizontalProductShimmer();
                  final widget = SkyCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  // Record found
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];
                      return FutureBuilder(
                        future: controller.getCategoryProducts(
                            categoryId: subCategory.id, limit: -1),
                        builder: (context, snapshot) {
                          /// Handle loader, No record, Or Error Message
                          final widget =
                              SkyCloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;

                          // Record found
                          final products = snapshot.data!;
                          return Column(
                            children: [
                              /// Heading
                              SkySectionHeading(
                                  title: subCategory.name,
                                  showActionButton: true,
                                  onPressed: () => Get.to(() => AllProducts(
                                        title: subCategory.name,
                                        futureMethod:
                                            controller.getCategoryProducts(
                                          categoryId: subCategory.id,
                                          limit: -1,
                                        ),
                                      ))),
                              const SizedBox(
                                  height: SkySizes.spaceBtwItems / 2),

                              /// Product cart horizontal
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                          width: SkySizes.spaceBtwItems),
                                  itemBuilder: (context, index) =>
                                      SkyProductCardHorizontal(
                                          product: products[index]),
                                ),
                              ),
                              const SizedBox(height: SkySizes.spaceBtwSections),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
