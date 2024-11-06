import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sky_store/common/widgets/loaders/animation_loader.dart';
import 'package:sky_store/common/widgets/slider_images/sky_rounded_image.dart';
import 'package:sky_store/common/widgets/text/product_title_text.dart';
import 'package:sky_store/features/shop/controllers/product/order_controller.dart';
import 'package:sky_store/features/shop/screens/order/widgets/order_details.dart';
import 'package:sky_store/navigation_menu.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/cloud_helper_function.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

class SkyOrderListItems extends StatelessWidget {
  const SkyOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    final orderController = Get.put(OrderController());
    return FutureBuilder(
      future: orderController.fetchUserOrders(),
      builder: (_, snapshot) {
        // Nothing found
        final emptyWidget = SkyAnimationLoaderWidget(
          text: 'No Orders Yet!',
          animation: SkyImages.emptyOrderList,
          showAction: true,
          actionText: 'Let\'s add some',
          onActionPressed: () => Get.offAll(() => const NavigationMenu()),
        );

        // Helper function: handle loader, no record, or error message
        final response = SkyCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        /// Record Found
        final orders = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, index) =>
              const SizedBox(height: SkySizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = orders[index];
            return SkyRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(SkySizes.sm),
              backgroundColor: darkMode ? SkyColors.dark : SkyColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// -- Row 1
                  Row(
                    children: [
                      /// Item Image
                      Expanded(
                          flex: 2,
                          child: SkyRoundedImage(
                            imageUrl: order.item[0].image!,
                            width: 50,
                            height: 50,
                            isNetworkImage: true,
                          )),

                      Expanded(
                          flex: 6,
                          child: SkyProductTitleText(
                            title: order.item[0].title,
                            maxLines: 1,
                          )),

                      const SizedBox(width: SkySizes.sm),

                      /// 3 - Icon
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(darkMode
                                  ? SkyColors.darkerGrey
                                  : Colors.transparent),
                              foregroundColor: WidgetStatePropertyAll(darkMode
                                  ? SkyColors.white
                                  : SkyColors.black)),
                          onPressed: () => Get.to(() => ItemOrderedDetails(
                                orderedItems: order,
                              )),
                          icon: const Icon(Iconsax.arrow_right_34,
                              size: SkySizes.iconLg),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: SkySizes.spaceBtwItems / 2),

                  /// -- Row 2
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            /// 1 - Icon
                            const Icon(Iconsax.ship),
                            const SizedBox(width: SkySizes.spaceBtwItems / 1.5),

                            /// 2 - Status & Date
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Order Date',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium,
                                  ),
                                  Text(order.formattedOrderDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Row Delivery Date
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            /// 1 - Icon
                            const Icon(Icons.calendar_month),
                            const SizedBox(width: SkySizes.spaceBtwItems / 1.5),

                            /// 2 - Status & Date
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  order.status.toString() == "OrderStatus.delivered"
                                      ? Text('Item Delivered',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium)
                                      : Text('Expected Delivery Date',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                  Text(order.formattedDeliveryDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: SkySizes.spaceBtwItems / 2),

                  /// -- Row 3
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            /// 1 - Icon
                            const Icon(Iconsax.status),
                            const SizedBox(width: SkySizes.spaceBtwItems / 1.5),
                            Text(
                              'Status: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium,
                            ),
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!.apply(color: SkyColors.primary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
