import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sky_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:sky_store/features/shop/models/payment_method_model.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

class SkyPaymentTile extends StatelessWidget {
  const SkyPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckOutController.instance;
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: SkyRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: SkyHelperFunctions.isDarkMode(context)
            ? SkyColors.light
            : SkyColors.white,
        padding: EdgeInsets.all(SkySizes.sm),
        child:
            Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
