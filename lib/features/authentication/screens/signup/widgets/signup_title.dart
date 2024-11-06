import 'package:flutter/material.dart';

import '../../../../../utils/constants/text_strings.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      SkyTexts.signUpTitle,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
