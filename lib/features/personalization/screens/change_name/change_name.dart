import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/features/personalization/controllers/change_name_controller.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/constants/text_strings.dart';
import 'package:sky_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: SkyAppBar(
        showBackArrow: true,
        title: Text('Change Name',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SkySizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(SkyTexts.changeNameSubtitle,
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: SkySizes.spaceBtwSections),

            /// TextField and Button
            Form(
              key: controller.changeNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        SkyValidator.validateEmptyText('First Name', value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: false,
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: SkyTexts.firstName,
                    ),
                  ),
                  const SizedBox(height: SkySizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        SkyValidator.validateEmptyText('Last Name', value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: SkyTexts.lastName,
                    ),
                  ),
                  const SizedBox(height: SkySizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => controller.updateUserName(),
                          child: const Text('Save')))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
