import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:sky_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:sky_store/features/authentication/screens/onboarding/widgets/onboarding_pages.dart';
import 'package:sky_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/text_strings.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: SkyImages.onBoarding_1,
                title: SkyTexts.onBoardingTitle1,
                subTitle: SkyTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: SkyImages.onBoarding_2,
                title: SkyTexts.onBoardingTitle2,
                subTitle: SkyTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: SkyImages.onBoarding_3,
                title: SkyTexts.onBoardingTitle3,
                subTitle: SkyTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
