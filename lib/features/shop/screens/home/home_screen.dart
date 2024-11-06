import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:sky_store/features/shop/screens/all_product/all_products.dart';
import 'package:sky_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:sky_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:sky_store/features/shop/screens/home/widgets/home_promo_slider.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../controllers/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body:  SingleChildScrollView(
              child: Column(
                children: [
                  SkyPrimaryHeaderContainer(
                    child: Column(
                      children: [
                        /// --- AppBar ---
                        const SkyHomeAppBar(),
                        const SizedBox(height: SkySizes.spaceBtwSections / 4),

                        /// --- Searcher ---
                        SkySearchContainer(
                          icon: Iconsax.search_normal,
                          text: 'Search in store',
                          showBackground: true,
                          showBorder: false,
                          onTap: () {},
                        ),
                        const SizedBox(height: SkySizes.spaceBtwSections / 2),

                        /// --- Categories ---
                        const Padding(
                          padding: EdgeInsets.only(left: SkySizes.defaultSpace),
                          child: Column(
                            children: [
                              /// -- Heading
                              SkySectionHeading(
                                  title: 'Popular Categories',
                                  textColor: SkyColors.white),
                              SizedBox(height: SkySizes.spaceBtwItems),

                              /// categories
                              SkyHomeCategories(),
                            ],
                          ),
                        ),
                        const SizedBox(height: SkySizes.spaceBtwSections),
                      ],
                    ),
                  ),

                  /// Body
                  Padding(
                    padding: const EdgeInsets.all(SkySizes.defaultSpace / 2),
                    child: Column(
                      children: [
                        /// --- Promo Slider ---
                        const PromoSlider(),
                        const SizedBox(height: SkySizes.spaceBtwSections / 2),

                        /// -- Heading
                        SkySectionHeading(
                          title: 'Popular Products',
                          onPressed: () => Get.to(() => AllProducts(
                              title: 'All Products',
                              futureMethod:
                                  controller.fetchAllFeaturedProducts())),
                          showActionButton: true,
                        ),
                        const SizedBox(height: SkySizes.spaceBtwItems),

                        /// --- Popular Products ---
                        Obx(() {
                          if (controller.isLoading.value) {
                            return const SkyVerticalProductShimmer();
                          }

                          if (controller.featuredProducts.isEmpty) {
                            return Center(
                                child: Text('No Data Found',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium));
                          }
                          return SkyGridLayout(
                            itemCount: controller.featuredProducts.length,
                            itemBuilder: (_, index) => SkyProductCardVertical(
                                product: controller.featuredProducts[index]),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            )
    );
  }
}
