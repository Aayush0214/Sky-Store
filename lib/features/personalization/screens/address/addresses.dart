import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/features/personalization/controllers/address_controller.dart';
import 'package:sky_store/features/personalization/screens/address/add_new_address.dart';
import 'package:sky_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:sky_store/utils/helpers/cloud_helper_function.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: SkyAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(SkySizes.defaultSpace),
            child: Obx(
              () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  /// Helper Function: Handle Loader, No record, Or error message
                  final response =
                      SkyCloudHelperFunctions.checkMultiRecordState(
                          snapshot: snapshot);
                  if (response != null) return response;

                  final addresses = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => SkySingleAddress(
                      address: addresses[index],
                      onTap: () => controller.selectAddress(addresses[index]),
                    ),
                  );
                },
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: SkyColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: SkyColors.white),
      ),
    );
  }
}
