import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/constants/text_strings.dart';
import 'package:sky_store/utils/validators/validation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: const SkyAppBar(showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(SkySizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              SkyTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: SkySizes.spaceBtwInputFields),
            Text(
              SkyTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: SkySizes.spaceBtwSections),

            /// TextField
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                autocorrect: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => SkyValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  labelText: SkyTexts.email,
                ),
              ),
            ),
            const SizedBox(height: SkySizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(SkyTexts.submit),
              ),
            )
          ],
        ),
      ),
    );
  }
}
