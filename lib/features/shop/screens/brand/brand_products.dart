import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/brands/brand_cards.dart';
import 'package:sky_store/common/widgets/products/sortable/sortable_product.dart';
import 'package:sky_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:sky_store/features/shop/controllers/brand_controller.dart';
import 'package:sky_store/features/shop/models/brand_model.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/cloud_helper_function.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: SkyAppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              SkyBrandCard(showBorder: true, brands: brand),
              const SizedBox(height: SkySizes.spaceBtwSections),

              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    const loader = SkyVerticalProductShimmer();
                    final widget =
                        SkyCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found!
                    final brandProducts = snapshot.data!;
                    return SkySortableProducts(products: brandProducts);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
