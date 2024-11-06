import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sky_store/data/repositories/authentication/authentication_repository.dart';
import 'package:sky_store/utils/helpers/network_manager.dart';
import 'package:sky_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/popups/full_screen_loader.dart';

import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loader
      SkyFullScreenLoader.openLoadingDialog('Loading', SkyImages.loading_2);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      SkyFullScreenLoader.stopLoading();

      // Show success screen
      SkyLoaders.successSnackBar(
          title: 'Email sent.',
          message: 'Email send to reset your password.'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      SkyFullScreenLoader.stopLoading();
      // show some Generic Error to the user
      SkyLoaders.errorSnackBar(title: 'Oh Error!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loader
      SkyFullScreenLoader.openLoadingDialog('Loading', SkyImages.loading_2);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      SkyFullScreenLoader.stopLoading();

      // Show success screen
      SkyLoaders.successSnackBar(
          title: 'Email sent.',
          message: 'Email send to reset your password.'.tr);
    } catch (e) {
      // Remove Loader
      SkyFullScreenLoader.stopLoading();
      // show some Generic Error to the user
      SkyLoaders.errorSnackBar(title: 'Oh Error!', message: e.toString());
    }
  }
}
