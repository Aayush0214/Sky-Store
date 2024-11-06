import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/shop/controllers/product/order_controller.dart';
import 'package:sky_store/features/shop/models/order_model.dart';
import 'package:sky_store/features/shop/screens/order/widgets/order_timeline.dart';
import 'package:sky_store/features/shop/screens/order/widgets/ordered_item_list.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/formatters/formatter.dart';

class ItemOrderedDetails extends StatelessWidget {
  const ItemOrderedDetails({super.key, required this.orderedItems});

  final OrderModel orderedItems;

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    final orderController = OrderController.instance;
    return Scaffold(
      appBar: SkyAppBar(
        title: Text(
          'Order Details',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              /// Ordered ID, Date of order
              SkyRoundedContainer(
                showBorder: false,
                radius: 10,
                padding: const EdgeInsets.all(SkySizes.md),
                backgroundColor: darkMode ? SkyColors.dark : SkyColors.light,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 8,
                            child: Text(orderedItems.id,
                                style:
                                    Theme.of(context).textTheme.headlineSmall)),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: orderedItems.paymentMethod ==
                                      'Cash On Delivery'
                                  ? orderedItems.status.toString() !=
                                          'OrderStatus.delivered'
                                      ? SkyColors.error
                                      : SkyColors.success
                                  : SkyColors.success,
                            ),
                            child: Center(
                                child: Text(
                                    orderedItems.paymentMethod ==
                                            'Cash On Delivery'
                                        ? orderedItems.status.toString() !=
                                                'OrderStatus.delivered'
                                            ? 'Unpaid'
                                            : 'Paid'
                                        : 'Paid',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(color: SkyColors.white))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SkySizes.sm),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text('Ordered Date:',
                                style:
                                    Theme.of(context).textTheme.labelMedium)),
                        Expanded(
                          flex: 3,
                          child: Text(orderedItems.formattedOrderDate,
                              style: Theme.of(context).textTheme.labelLarge),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                            flex: 3,
                            child: Text('Payment Using:',
                                style:
                                    Theme.of(context).textTheme.labelMedium)),
                        Expanded(
                          flex: 2,
                          child: Text(orderedItems.paymentMethod,
                              style: Theme.of(context).textTheme.labelLarge),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: SkySizes.spaceBtwInputFields / 2),

              SkySectionHeading(title: 'Ordered Items'),

              const SizedBox(height: SkySizes.spaceBtwInputFields / 2),

              /// List of Ordered Items
              SkyRoundedContainer(
                showBorder: false,
                radius: 10,
                padding: const EdgeInsets.all(SkySizes.sm),
                backgroundColor: darkMode ? SkyColors.dark : SkyColors.light,
                child: SizedBox(height: 310,child: OrderedItemList(orderedItemsList: orderedItems)),
              ),

              const SizedBox(height: SkySizes.spaceBtwInputFields / 2),

              SkySectionHeading(title: 'Order Status'),

              const SizedBox(height: SkySizes.spaceBtwInputFields / 2),

              // OrderTimeline(orderDetails: orderedItems),
              OrderTrackingTimeline(
                  currentStep: orderController.fetchOrderStatus(orderedItems)),

              const SizedBox(height: SkySizes.spaceBtwInputFields / 2),

              SkySectionHeading(title: 'Billing Amount'),

              const SizedBox(height: SkySizes.spaceBtwInputFields / 2),

              /// Billing Section
              SkyRoundedContainer(
                showBorder: false,
                radius: 10,
                padding: const EdgeInsets.all(SkySizes.md),
                backgroundColor: darkMode ? SkyColors.dark : SkyColors.light,
                child: Column(
                  children: [
                    /// SubTotal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('₹${orderedItems.subtotal}',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: SkySizes.spaceBtwItems / 2),

                    /// Shipping Fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping Fee',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('₹${orderedItems.shippingCost}',
                            style: Theme.of(context).textTheme.labelLarge),
                      ],
                    ),
                    const SizedBox(height: SkySizes.spaceBtwItems / 2),

                    /// Tax Fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tax Fee',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('₹${orderedItems.tax}',
                            style: Theme.of(context).textTheme.labelLarge),
                      ],
                    ),
                    const SizedBox(height: SkySizes.spaceBtwItems / 2),

                    /// Order Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order Total',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('₹${orderedItems.totalAmount}',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: SkySizes.spaceBtwInputFields / 2),

              SkySectionHeading(title: 'Shipping Address'),

              const SizedBox(height: SkySizes.spaceBtwInputFields / 2),

              /// Address Section
              SkyRoundedContainer(
                showBorder: false,
                radius: 10,
                padding: const EdgeInsets.all(SkySizes.md),
                backgroundColor: darkMode ? SkyColors.dark : SkyColors.light,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.grey, size: 16),
                        const SizedBox(width: SkySizes.spaceBtwItems),
                        Text(orderedItems.address!.name,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    const SizedBox(height: SkySizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.call, color: Colors.grey, size: 16),
                        const SizedBox(width: SkySizes.spaceBtwItems),
                        Text(
                            SkyFormatter.formatPhoneNumber(
                                orderedItems.address!.phoneNumber),
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: SkySizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.location_city,
                            color: Colors.grey, size: 16),
                        const SizedBox(width: SkySizes.spaceBtwItems),
                        Expanded(
                          child: Text(
                            '${orderedItems.address!.street}, ${orderedItems.address!.city}, ${orderedItems.address!.postalCode}, ${orderedItems.address!.state}, ${orderedItems.address!.country}  ',
                            style: Theme.of(context).textTheme.bodyMedium,
                            softWrap: true,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
