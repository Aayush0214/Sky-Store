import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../controllers/product/checkout_controller.dart';

class SkyBillingPaymentSection extends StatelessWidget {
  const SkyBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SkySectionHeading(
          title: 'Payment Method',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        const SizedBox(height: SkySizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              SkyRoundedContainer(
                width: 50,
                height: 50,
                showBorder: true,
                backgroundColor: darkMode ? SkyColors.light : SkyColors.grey,
                padding: const EdgeInsets.all(SkySizes.sm),
                child: Image(
                    image: AssetImage(
                        controller.selectedPaymentMethod.value.image),
                    fit: BoxFit.contain),
              ),
              const SizedBox(width: SkySizes.spaceBtwItems / 2),
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
