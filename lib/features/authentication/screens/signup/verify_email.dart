import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/data/repositories/authentication/authentication_repository.dart';
import 'package:sky_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logOut(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          // Padding to give default equal space on all sides in all screens
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Image
              Image(
                width: SkyHelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(SkyImages.emailVerification),
              ),
              const SizedBox(height: SkySizes.spaceBtwSections),

              /// Title & SubTitle
              Text(
                SkyTexts.emailVerifyTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SkySizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SkySizes.spaceBtwItems),
              Text(
                SkyTexts.emailVerifySubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SkySizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(SkyTexts.continueButton),
                ),
              ),
              const SizedBox(height: SkySizes.spaceBtwItems),
              TextButton(
                onPressed: () => controller.sendEmailVerification(),
                child: const Text(SkyTexts.resendEmail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
