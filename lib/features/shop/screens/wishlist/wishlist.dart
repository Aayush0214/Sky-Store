import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/icons/sky_circular_icon.dart';
import 'package:sky_store/common/widgets/layouts/grid_layout.dart';
import 'package:sky_store/common/widgets/loaders/animation_loader.dart';
import 'package:sky_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:sky_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:sky_store/features/shop/controllers/product/favorites_controller.dart';
import 'package:sky_store/features/shop/screens/home/home_screen.dart';
import 'package:sky_store/navigation_menu.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/cloud_helper_function.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: SkyAppBar(
        title: Text('My Wishlist',
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          SkyCircularIcon(
            height: 50,
            width: 50,
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              future: controller.favouriteProducts(),
              builder: (context, snapshot) {
                /// Nothing Found Widget
                final emptyWidget = SkyAnimationLoaderWidget(
                  text: 'Your haven\'t added any products yet.',
                  animation: SkyImages.emptyCart,
                  actionText: 'Find items to save',
                  showAction: false,
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );

                const loader = SkyVerticalProductShimmer(itemCount: 6);
                final widget = SkyCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget);
                if (widget != null) return widget;

                final products = snapshot.data!;
                return SkyGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) =>
                        SkyProductCardVertical(product: products[index]));
              },
            ),
          ),
        ),
      ),
    );
  }
}
