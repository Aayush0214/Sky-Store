import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/appbar/tabbar.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sky_store/common/widgets/layouts/grid_layout.dart';
import 'package:sky_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sky_store/common/widgets/shimmer/brand_shimmer.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/shop/controllers/brand_controller.dart';
import 'package:sky_store/features/shop/screens/brand/all_brands.dart';
import 'package:sky_store/features/shop/screens/brand/brand_products.dart';
import 'package:sky_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_cards.dart';
import '../../controllers/category_controller.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: SkyAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [SkyCartCounterIcon()],
        ),
        body: NestedScrollView(
          /// -- Header --
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              /// -- Sticky AppBar
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: SkyHelperFunctions.isDarkMode(context)
                    ? SkyColors.black
                    : SkyColors.white,
                expandedHeight: 400,

                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(SkySizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search Bar
                      const SizedBox(height: SkySizes.spaceBtwItems),
                      SkySearchContainer(
                        onTap: () {},
                        icon: Iconsax.search_normal,
                        text: 'Search in Store',
                        showBackground: false,
                        showBorder: true,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: SkySizes.spaceBtwSections / 2),

                      /// -- Featured Brands
                      SkySectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                        showActionButton: true,
                      ),
                      const SizedBox(height: SkySizes.spaceBtwItems / 8),

                      /// -- Brands Grid
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return const SkyBrandShimmer();
                        }
                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text('No Data Found!',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: Colors.white)),
                          );
                        }
                        return SkyGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 75,
                            itemBuilder: (_, index) {
                              final brand =
                                  brandController.featuredBrands[index];
                              return SkyBrandCard(
                                showBorder: true,
                                brands: brand,
                                onTap: () =>
                                    Get.to(() => BrandProducts(brand: brand)),
                              );
                            });
                      })
                    ],
                  ),
                ),

                /// -- Tabs
                bottom: SkyTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList()),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => SkyCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
