import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/common/widgets/appbar/appbar.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:sky_store/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/data/repositories/authentication/authentication_repository.dart';
import 'package:sky_store/features/personalization/screens/address/addresses.dart';
import 'package:sky_store/features/personalization/screens/profile/profile.dart';
import 'package:sky_store/features/shop/screens/load_data/load_all_data.dart';
import 'package:sky_store/features/shop/screens/order/order.dart';
import 'package:sky_store/utils/constants/colors.dart';

import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/cart/cart.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            SkyPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  SkyAppBar(
                    title: Text("Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: SkyColors.white)),
                  ),

                  /// -- User Profile Card
                  SkyUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: SkySizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(SkySizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const SkySectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: SkySizes.spaceBtwItems),

                  SkySettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: "My Addresses",
                      subTitle: "Set shopping delivery address",
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  SkySettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subTitle: "Add, remove products and move to checkout",
                      onTap: () => Get.to(() => const CartScreen())),
                  SkySettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: "My Orders",
                      subTitle: "In-progress and Completed Orders",
                      onTap: () => Get.to(() => const OrderScreen())),
                  SkySettingsMenuTile(
                      icon: Iconsax.bank,
                      title: "Bank Account",
                      subTitle: "Withdraw balance to registered bank account",
                      onTap: () {}),
                  SkySettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subTitle: "List of all the discounted coupons",
                      onTap: () {}),
                  SkySettingsMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subTitle: "Set any kind of notification message",
                      onTap: () {}),
                  SkySettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subTitle: "Manage data usage and connected accounts",
                      onTap: () {}),

                  /// -- App Settings
                  const SizedBox(height: SkySizes.spaceBtwSections),
                  const SkySectionHeading(
                      title: "App Settings", showActionButton: false),
                  const SizedBox(height: SkySizes.spaceBtwItems),
                  // SkySettingsMenuTile(
                  //   icon: Iconsax.document_upload,
                  //   title: 'Load Data',
                  //   subTitle: "Upload Data to your Cloud Firebase",
                  //   onTap: () => Get.to(() => const LoadAllData()),
                  // ),
                  SkySettingsMenuTile(
                      icon: Iconsax.location,
                      title: "Location",
                      subTitle: "Set recommendation based on location",
                      trailing: Switch(value: true, onChanged: (value) {})),
                  SkySettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: "Safe Mode",
                      subTitle: "Search result is safe for all ages",
                      trailing: Switch(value: false, onChanged: (value) {})),
                  SkySettingsMenuTile(
                      icon: Iconsax.image,
                      title: "HD Image Quality",
                      subTitle: "Set image quality to be seen",
                      trailing: Switch(value: false, onChanged: (value) {})),

                  /// -- LogOut Button
                  const SizedBox(height: SkySizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () =>
                              AuthenticationRepository.instance.logOut(),
                          child: const Text('Logout')))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
