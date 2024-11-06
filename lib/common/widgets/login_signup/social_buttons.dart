import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/features/authentication/controllers/login/login_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// google
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SkyColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              height: SkySizes.iconMd,
              width: SkySizes.iconMd,
              image: AssetImage(SkyImages.google),
            ),
          ),
        ),
        const SizedBox(width: SkySizes.spaceBtwItems),

        /// facebook
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SkyColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              height: SkySizes.iconMd,
              width: SkySizes.iconMd,
              image: AssetImage(SkyImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
