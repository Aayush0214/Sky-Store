import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/brands/brand_show_case.dart';
import 'package:sky_store/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:sky_store/features/shop/controllers/brand_controller.dart';
import 'package:sky_store/features/shop/models/category_model.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/cloud_helper_function.dart';

import '../../../../../common/widgets/shimmer/boxes_shimmer.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          /// Handle Loader, No Record, Or error message
          const loader = Column(
            children: [
              SkyListTileShimmer(),
              SizedBox(height: SkySizes.spaceBtwItems),
              SkyBoxesShimmer(),
              SizedBox(height: SkySizes.spaceBtwItems),
            ],
          );

          final widget = SkyCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          /// Record Found!
          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    final widget =
                        SkyCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found!
                    final products = snapshot.data!;

                    return SkyBrandShowcase(
                        brand: brand,
                        images: products.map((e) => e.thumbnail).toList());
                  });
            },
          );
        });
  }
}
