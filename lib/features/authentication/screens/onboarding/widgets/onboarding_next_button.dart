import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SkyHelperFunctions.isDarkMode(context);
    return Positioned(
      right: SkySizes.defaultSpace,
      bottom: SkyDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? SkyColors.primary : Colors.black),
        child: const Icon(
          Iconsax.arrow_right_3,
        ),
      ),
    );
  }
}
