import 'package:flutter/material.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardSkip extends StatelessWidget {
  const OnBoardSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SkyHelperFunctions.isDarkMode(context);
    return Positioned(
      top: SkyDeviceUtils.getAppBarHeight(),
      right: SkySizes.defaultSpace,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: dark ? SkyColors.primary : Colors.black,
        ),
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text(
          'SKIP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: SkyColors.light,
          ),
        ),
      ),
    );
  }
}
