import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/list_tile/upload_data_tile.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/data/repositories/banners/banner_repository.dart';
import 'package:sky_store/data/repositories/brand/brand_repository.dart';
import 'package:sky_store/data/repositories/categories/category_repository.dart';
import 'package:sky_store/data/repositories/product/product_repository.dart';
import 'package:sky_store/utils/constants/dummy_data.dart';
import 'package:sky_store/utils/constants/sizes.dart';

class LoadAllData extends StatelessWidget {
  const LoadAllData({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryRepository());
    final bannerController = Get.put(BannerRepository());
    final productController = Get.put(ProductRepository());
    final brandController = Get.put(BrandRepository());
    return Scaffold(
      appBar: SkyAppBar(
        showBackArrow: true,
        title: Text('Upload Data',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Main Record Heading
              const SkySectionHeading(title: 'Main Record'),
              const SizedBox(height: SkySizes.spaceBtwItems),

              UploadDataTile(
                icon: Iconsax.category,
                title: 'Upload Categories',
                trailing: Iconsax.arrow_up_1,
                onTap: () =>
                    categoryController.uploadDummyData(DummyData.categories),
              ),
              const SizedBox(height: SkySizes.spaceBtwItems),

              UploadDataTile(
                icon: Iconsax.shop,
                title: 'Upload Brands',
                trailing: Iconsax.arrow_up_1,
                onTap: () => brandController.uploadBrands(DummyData.brands),
              ),
              const SizedBox(height: SkySizes.spaceBtwItems),

              UploadDataTile(
                icon: Iconsax.shopping_cart,
                title: 'Upload Products',
                trailing: Iconsax.arrow_up_1,
                onTap: () =>
                    productController.uploadDummyData(DummyData.products),
              ),
              const SizedBox(height: SkySizes.spaceBtwItems),

              UploadDataTile(
                icon: Iconsax.gallery,
                title: 'Upload Banners',
                trailing: Iconsax.arrow_up_1,
                onTap: () =>
                    bannerController.uploadBannerData(DummyData.banners),
              ),
              const SizedBox(height: SkySizes.spaceBtwSections),

              const SkySectionHeading(title: 'Relationships'),
              const SizedBox(height: SkySizes.sm),
              const Text(
                  'Make sure you have already uploaded all the content above.'),

              const SizedBox(height: SkySizes.spaceBtwItems),

              UploadDataTile(
                icon: Iconsax.link_1,
                title: 'Upload Brands & Categories Relation Data',
                trailing: Iconsax.arrow_up_1,
                onTap: () => brandController
                    .uploadBrandsForCategory(DummyData.brandsForCategories),
              ),
              const SizedBox(height: SkySizes.spaceBtwItems),

              UploadDataTile(
                icon: Iconsax.link_1,
                title: 'Upload Product Categories Relation Data',
                trailing: Iconsax.arrow_up_1,
                onTap: () => productController
                    .uploadProductForCategory(DummyData.productsForCategories),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
