import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/brands/brand_cards.dart';
import 'package:sky_store/common/widgets/layouts/grid_layout.dart';
import 'package:sky_store/common/widgets/shimmer/brand_shimmer.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/shop/controllers/brand_controller.dart';
import 'package:sky_store/features/shop/screens/brand/brand_products.dart';
import 'package:sky_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const SkyAppBar(
        showBackArrow: true,
        title: Text('Brand'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const SkySectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: SkySizes.spaceBtwItems),

              /// -- Brands
              Obx(() {
                if (brandController.isLoading.value) {
                  return const SkyBrandShimmer();
                }
                if (brandController.allBrands.isEmpty) {
                  return Center(
                      child: Text('No Data Found!',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: Colors.white)));
                }
                return SkyGridLayout(
                    mainAxisExtent: 80,
                    itemCount: brandController.allBrands.length,
                    itemBuilder: (context, index) {
                      final brand = brandController.allBrands[index];
                      return SkyBrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => BrandProducts(brand: brand)),
                        brands: brand,
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
