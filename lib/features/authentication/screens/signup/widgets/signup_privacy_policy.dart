import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignUpPrivacyPolicy extends StatelessWidget {
  const SignUpPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = SkyHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value,
              )),
        ),
        const SizedBox(width: SkySizes.sm),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: ' ${SkyTexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: ' ${SkyTexts.privacyPolicy} ',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? SkyColors.white : SkyColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? SkyColors.white : SkyColors.primary)),
                TextSpan(
                    text: ' ${SkyTexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: ' ${SkyTexts.termsOfUse} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? SkyColors.white : SkyColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? SkyColors.white : SkyColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
