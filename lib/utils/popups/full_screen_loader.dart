import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/loaders/animation_loader.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

class SkyFullScreenLoader {
  /// Open a full-Screen loading dialog with a given text and animation.
  /// This method doesn't return anything.

  /// Parameters:
  ///   -text: The text to be displayed in the loading dialog.
  ///   -animation: The Lottie animation to be shown.

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // Use Get.overlayContext for overlays dialogs
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: SkyHelperFunctions.isDarkMode(Get.context!)
              ? SkyColors.dark
              : SkyColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SkyAnimationLoaderWidget(
              text: text,
              animation: animation,
            ),
          ),
        ),
      ),
    );
  }

  /// stop the currently open loading dialog
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // Close the dialog using the Navigator
  }
}
