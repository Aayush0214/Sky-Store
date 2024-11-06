import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/login_signup/form_divider.dart';
import 'package:sky_store/common/widgets/login_signup/social_buttons.dart';
import 'package:sky_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:sky_store/features/authentication/screens/signup/widgets/signup_title.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SkyAppBar(
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SkySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              SignUpTitle(),
              SizedBox(height: SkySizes.spaceBtwSections / 2),

              /// Form
              SignUpForm(),
              SizedBox(height: SkySizes.spaceBtwSections),

              /// Divider
              FormDivider(dividerText: SkyTexts.orSignUpWith),
              SizedBox(height: SkySizes.spaceBtwInputFields),
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
