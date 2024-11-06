import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sky_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:sky_store/features/authentication/screens/signup/widgets/signup_privacy_policy.dart';
import 'package:sky_store/utils/validators/validation.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// First & Last name row
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) =>
                      SkyValidator.validateEmptyText('First name', value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: false,
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: SkyTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(width: SkySizes.md),
              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value) =>
                      SkyValidator.validateEmptyText('Last name', value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: false,
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: SkyTexts.lastName,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: SkySizes.md),

          /// TextField Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                SkyValidator.validateEmptyText('Username', value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_add),
              labelText: SkyTexts.userName,
            ),
          ),
          const SizedBox(height: SkySizes.md),

          /// TextField E-Mail
          TextFormField(
            controller: controller.email,
            validator: (value) => SkyValidator.validateEmail(value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail_outline),
              labelText: SkyTexts.email,
            ),
          ),
          const SizedBox(height: SkySizes.md),

          /// TextField Password
          Obx(
                () => TextFormField(
              controller: controller.password,
              validator: (value) => SkyValidator.validatePassword(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              expands: false,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: SkyTexts.password,
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                    !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(height: SkySizes.md),

          /// TextField Phone No.
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
          const SizedBox(height: SkySizes.md),

          /// Date of Birth
          TextFormField(
            controller: controller.birthDate,
            validator: (value) =>
                SkyValidator.validateEmptyText('Date of Birth', value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: true,
            autocorrect: false,
            expands: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.calendar),
              label: const Text('Birthday'),
              suffixIcon: IconButton(
                onPressed: () => controller.selectDate(context),
                icon: const Icon(Iconsax.calendar_1),
              ),
            ),
          ),
          const SizedBox(height: SkySizes.spaceBtwItems),

          /// Privacy Policy and Term of use
          const SignUpPrivacyPolicy(),
          const SizedBox(height: SkySizes.spaceBtwSections),

          /// Create Account Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(SkyTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
