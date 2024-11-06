import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class SkyCouponCode extends StatelessWidget {
  const SkyCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    return SkyRoundedContainer(
      showBorder: true,
      backgroundColor: darkMode ? SkyColors.dark : SkyColors.white,
      padding: const EdgeInsets.only(
          top: SkySizes.sm,
          bottom: SkySizes.sm,
          right: SkySizes.sm,
          left: SkySizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              autocorrect: false,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Enter your promo code',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Apply Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: darkMode
                      ? SkyColors.white.withOpacity(0.5)
                      : SkyColors.dark.withOpacity(0.5),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1))),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
