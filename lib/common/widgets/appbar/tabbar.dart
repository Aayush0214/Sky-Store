import 'package:flutter/material.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/device/device_utility.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

class SkyTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If you want to add the background color to tabs you have to wrap them in Material Widget
  /// To do that we need [PreferredSized] widget and that's why created custom class. [PreferredSizeWidget]
  const SkyTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final darkMode = SkyHelperFunctions.isDarkMode(context);
    return Material(
      color: darkMode ? SkyColors.black : SkyColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: SkyColors.primary,
        labelColor: darkMode ? SkyColors.white : SkyColors.primary,
        unselectedLabelColor: SkyColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SkyDeviceUtils.getAppBarHeight());
}
