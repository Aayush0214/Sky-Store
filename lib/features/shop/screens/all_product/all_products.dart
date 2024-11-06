import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:sky_store/features/shop/controllers/all_product_controller.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/cloud_helper_function.dart';
import '../../../../common/widgets/products/sortable/sortable_product.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: const SkyAppBar(
        showBackArrow: true,
        title: Text('Popular Products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                // check the state of the FutureBuilder snapshot
                const loader = SkyVerticalProductShimmer();
                final widget = SkyCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);

                // Return appropriate widget based on snapshot state
                if (widget != null) return widget;

                // Products found
                final products = snapshot.data!;

                return SkySortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}
