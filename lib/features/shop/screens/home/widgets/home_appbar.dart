import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/features/personalization/controllers/user_controller.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/shimmer/skyshimmer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class SkyHomeAppBar extends StatelessWidget {
  const SkyHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return SkyAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(SkyTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: SkyColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const SkyShimmerEffect(width: 80, height: 15);
            }
            return Text(controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: SkyColors.white));
          }),
        ],
      ),
      actions: [
        SkyCartCounterIcon(iconColor: SkyColors.white, counterBgColor: SkyColors.black, counterTextColor: SkyColors.white)
      ],
    );
  }
}
