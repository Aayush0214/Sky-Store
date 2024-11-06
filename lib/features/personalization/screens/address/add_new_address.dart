import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/features/personalization/controllers/address_controller.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: const SkyAppBar(
        showBackArrow: true,
        title: Text('Add new address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.name,
                  validator: (value) => SkyValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(height: SkySizes.spaceBtwInputFields),
                IntlPhoneField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialCountryCode: 'IN',
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: SkyColors.grey),
                    ),
                  ),
                  languageCode: "en",
                  onChanged: (phone) {
                    controller.selectedCountryCode.value = phone.countryCode;
                    controller.phoneNumber.value = phone.number;
                  },
                ),
                const SizedBox(height: SkySizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autocorrect: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.street,
                        validator: (value) => SkyValidator.validateEmptyText('Street', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'Street'),
                      ),
                    ),
                    const SizedBox(width: SkySizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        autocorrect: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.postalCode,
                        keyboardType: TextInputType.number,
                        validator: (value) => SkyValidator.validateEmptyText('Postal Code', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code_1),
                            labelText: 'Postal Code'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SkySizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autocorrect: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.city,
                        validator: (value) => SkyValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.buildings_24),
                            labelText: 'City'),
                      ),
                    ),
                    const SizedBox(width: SkySizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        autocorrect: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.state,
                        validator: (value) => SkyValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'State'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SkySizes.spaceBtwInputFields),
                TextFormField(
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.country,
                  validator: (value) => SkyValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(height: SkySizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.addNewAddresses(), child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
