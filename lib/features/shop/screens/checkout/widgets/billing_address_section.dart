import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/personalization/controllers/address_controller.dart';
import 'package:sky_store/utils/formatters/formatter.dart';

import '../../../../../utils/constants/sizes.dart';

class SkyBillingAddressSection extends StatelessWidget {
  const SkyBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkySectionHeading(
          title: 'Shipping Address',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () => addressController.selectNewAddressPopUp(context),
        ),
        Obx(
        () => addressController.selectedAddress.value.id.isNotEmpty
                ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person, color: Colors.grey, size: 16),
                            const SizedBox(width: SkySizes.spaceBtwItems),
                            Text(addressController.selectedAddress.value.name,
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                        const SizedBox(height: SkySizes.spaceBtwItems / 2),
                        Row(
                          children: [
                            const Icon(Icons.call, color: Colors.grey, size: 16),
                            const SizedBox(width: SkySizes.spaceBtwItems),
                            Text(
                                SkyFormatter.formatPhoneNumber(addressController
                                    .selectedAddress.value.phoneNumber),
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
                                '${addressController.selectedAddress.value.street}, ${addressController.selectedAddress.value.city}, ${addressController.selectedAddress.value.postalCode}, ${addressController.selectedAddress.value.state}, ${addressController.selectedAddress.value.country}  ',
                                style: Theme.of(context).textTheme.bodyMedium,
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                : Text('Select Address',
                    style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}
