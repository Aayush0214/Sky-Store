import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/sky_circular_image.dart';
import '../shimmer/skyshimmer.dart';

class SkyUserProfileTile extends StatelessWidget {
  const SkyUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : SkyImages.user;
        return controller.imageUploading.value
            ? const SkyShimmerEffect(width: 80, height: 80, radius: 80)
            : SkyCircularImage(
                image: image,
                width: 56,
                height: 56,
                padding: 0,
                isNetworkImage: networkImage.isNotEmpty);
      }),
      title: Text(controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: SkyColors.white)),
      subtitle: Text(controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: SkyColors.white)),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit, color: SkyColors.white)),
    );
  }
}
