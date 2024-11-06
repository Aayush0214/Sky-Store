import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/images/sky_circular_image.dart';
import 'package:sky_store/common/widgets/shimmer/skyshimmer.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/personalization/screens/change_name/change_name.dart';
import 'package:sky_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/formatters/formatter.dart';

import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const SkyAppBar(showBackArrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SkySizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : SkyImages.user;
                      return controller.imageUploading.value
                          ? const SkyShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : SkyCircularImage(
                              image: image,
                              width: 100,
                              height: 100,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Edit Profile Image')),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: SkySizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SkySizes.spaceBtwItems),
              const SkySectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: SkySizes.spaceBtwItems),

              SkyProfileMenu(
                  title: 'Name',
                  value:
                      '${controller.user.value.firstName} ${controller.user.value.lastName}',
                  showIcon: true,
                  onPressed: () => Get.to(() => const ChangeName())),
              SkyProfileMenu(
                  title: 'username',
                  value: controller.user.value.username.toString(),
                  showIcon: false,
                  onPressed: () {}),
              SkyProfileMenu(
                  title: 'User ID',
                  value: controller.user.value.id,
                  showIcon: true,
                  icon: Iconsax.copy,
                  onPressed: () {}),
              SkyProfileMenu(
                  title: 'E-Mail',
                  value: controller.user.value.email,
                  showIcon: false,
                  onPressed: () {}),
              SkyProfileMenu(
                  title: 'Phone Number',
                  value: SkyFormatter.formatPhoneNumber(controller.user.value.phoneNumber.toString()),
                  showIcon: true,
                  onPressed: () {}),
              SkyProfileMenu(
                  title: 'Date of Birth',
                  value: controller.user.value.birthDate.toString(),
                  onPressed: () {}),

              const SizedBox(height: SkySizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: SkySizes.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text('Close Account',
                        style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
