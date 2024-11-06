import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/features/personalization/screens/settings/setting_screen.dart';
import 'package:sky_store/features/shop/screens/home/home_screen.dart';
import 'package:sky_store/features/shop/screens/store/store_screen.dart';
import 'package:sky_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';
import 'package:sky_store/utils/helpers/network_manager.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 0,
          backgroundColor: darkMode ? SkyColors.black : SkyColors.light,
          indicatorColor: darkMode
              ? SkyColors.white.withOpacity(0.1)
              : SkyColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(
        () => NetworkManager.instance.isNetworkConnected.value
            ? controller.screens[controller.selectedIndex.value]
            : Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(SkyImages.noInternet, height: 150, width: 150, color: darkMode ? SkyColors.white : SkyColors.black),
              SizedBox(height: SkySizes.lg),
              Text('No Internet Connection!', style: Theme.of(context).textTheme.headlineSmall)
            ],
          ),
        )
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingScreen(),
  ];
}
