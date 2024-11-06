import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sky_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:sky_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:sky_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:sky_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/pricing_calculator.dart';
import 'package:sky_store/utils/popups/loaders.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/product/cart_controller.dart';
import '../../controllers/product/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());
    final subTotal = cartController.totalCartPrice;
    final shippingCost =
        double.parse(SkyPricingCalculator.calculateShippingCost(subTotal.value, 'IN'));
    final totalAmount =
        SkyPricingCalculator.calculateTotalPrice(subTotal.value, 'IN');
    final tax = double.parse(SkyPricingCalculator.calculateTax(subTotal.value, 'IN'));

    return Scaffold(
      appBar: SkyAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Column(
            children: [
              /// -- Item in Cart
              const SkyCartItems(showAddRemoveButton: false),
              const SizedBox(height: SkySizes.spaceBtwSections / 2),

              /// -- Coupon TextField
              const SkyCouponCode(),
              const SizedBox(height: SkySizes.spaceBtwSections / 2),

              /// -- Billing Section
              SkyRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(SkySizes.md),
                backgroundColor: darkMode ? SkyColors.black : SkyColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    SkyBillingAmountSection(),
                    SizedBox(height: SkySizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: SkySizes.spaceBtwItems / 2),

                    /// Payment Methods
                    SkyBillingPaymentSection(),
                    SizedBox(height: SkySizes.spaceBtwItems),

                    /// Address
                    SkyBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SkySizes.md),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(
                    subTotal.value, shippingCost, tax, totalAmount)
                : () => SkyLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed.'),
            child: Text('Pay ₹$totalAmount')),
      ),
    );
  }
}
