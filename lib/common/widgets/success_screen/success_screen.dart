import 'package:flutter/material.dart';
import 'package:sky_store/common/styles/spacing_styles.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SkySpacingStyle.paddingWithAppBarHeigh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Image
              Image(
                width: SkyHelperFunctions.screenWidth() * 0.8,
                height: SkyHelperFunctions.screenHeight() * 0.4,
                image: AssetImage(image),
              ),
              const SizedBox(height: SkySizes.spaceBtwSections),

              /// Successful Title & SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SkySizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SkySizes.spaceBtwSections),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(SkyTexts.continueButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
