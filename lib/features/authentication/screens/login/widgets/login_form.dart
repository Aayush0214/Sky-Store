import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/features/authentication/controllers/login/login_controller.dart';
import 'package:sky_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:sky_store/features/authentication/screens/signup/signup.dart';
import 'package:sky_store/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SkySizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => SkyValidator.validateEmail(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail_outline),
                labelText: SkyTexts.email,
              ),
            ),
            const SizedBox(height: SkySizes.spaceBtwInputFields),

            /// password
            Obx(
              () => TextFormField(
                controller: controller.password,
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
            const SizedBox(height: SkySizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value)),
                    const Text(SkyTexts.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                    child: const Text(SkyTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: SkySizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(SkyTexts.signIn))),
            const SizedBox(height: SkySizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignUpScreen()),
                    child: const Text(SkyTexts.createAccount))),
            const SizedBox(height: SkySizes.spaceBtwInputFields),
          ],
        ),
      ),
    );
  }
}
