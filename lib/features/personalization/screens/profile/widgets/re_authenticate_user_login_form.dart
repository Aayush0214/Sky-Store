import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/features/personalization/controllers/user_controller.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/constants/text_strings.dart';

import '../../../../../utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const SkyAppBar(
          showBackArrow: true, title: Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => SkyValidator.validateEmail(value),
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: SkyTexts.email,
                  ),
                ),
                const SizedBox(height: SkySizes.spaceBtwInputFields),

                /// password
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        SkyValidator.validateEmptyText('Password', value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: false,
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: SkyTexts.password,
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: controller.hidePassword.value
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye)),
                    ),
                  ),
                ),
                const SizedBox(height: SkySizes.spaceBtwSections),

                // Login Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPasswordUser(),
                        child: const Text(SkyTexts.signIn))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
