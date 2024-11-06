import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/features/personalization/controllers/address_controller.dart';
import 'package:sky_store/features/personalization/models/address_model.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class SkySingleAddress extends StatelessWidget {
  const SkySingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = SkyHelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: SkyRoundedContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(SkySizes.md),
          showBorder: true,
          backgroundColor: selectedAddress
              ? SkyColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? SkyColors.darkerGrey
                  : SkyColors.grey,
          margin: const EdgeInsets.only(bottom: SkySizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? SkyColors.light
                          : SkyColors.dark
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: SkySizes.sm),
                  Text(address.formattedPhoneNo,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: SkySizes.sm),
                  Text(
                      address.toString(),
                      softWrap: true),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
