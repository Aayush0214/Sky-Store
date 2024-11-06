import 'package:flutter/material.dart';
import 'package:sky_store/common/styles/spacing_styles.dart';
import 'package:sky_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:sky_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/constants/text_strings.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SkySpacingStyle.paddingWithAppBarHeigh,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              LoginHeader(),

              /// Form
              LoginForm(),

              /// Divider
              FormDivider(dividerText: SkyTexts.orSignInWith),
              SizedBox(height: SkySizes.spaceBtwInputFields),

              /// Footer with social icons
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
