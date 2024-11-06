import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sky_store/data/repositories/authentication/authentication_repository.dart';
import 'package:sky_store/features/personalization/controllers/user_controller.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final email = TextEditingController(); // Controller for email input
  final password = TextEditingController(); // Controller for password input
  final hidePassword = true.obs; // Observable for hiding/showing password
  final rememberMe = true.obs; // Observable for checking remember me
  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(); // Form key for login form validation
  final userController = Get.put(UserController());

  @override
  void onInit() {
    getEmailAndPassword();
    super.onInit();
  }

  /// -- Email and password SignIn
  void emailAndPasswordSignIn() async {
    try {
      // Start Loading
      SkyFullScreenLoader.openLoadingDialog('Processing', SkyImages.loading_2);

      // Check Internet Connection
      final isNetworkConnected = await NetworkManager.instance.isConnected();
      if (!isNetworkConnected) {
        // Remove Loader
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Login Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_MY_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_MY_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove loader
      SkyFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      SkyFullScreenLoader.stopLoading();
      // show some Generic Error to the user
      SkyLoaders.errorSnackBar(title: 'What happened?', message: e.toString());
    }
  }

  /// -- Fetching email and password from local storage
  void getEmailAndPassword() {
    if (localStorage.read('REMEMBER_MY_EMAIL') == null &&
        localStorage.read('REMEMBER_MY_PASSWORD') == null) {
      email.text = '';
      password.text = '';
    } else {
      email.text = localStorage.read('REMEMBER_MY_EMAIL');
      password.text = localStorage.read('REMEMBER_MY_PASSWORD');
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // start loading
      SkyFullScreenLoader.openLoadingDialog(
          'Logging you in...', SkyImages.loading_2);

      // Check Internet Connectivity
      final isNetworkConnected = await NetworkManager.instance.isConnected();
      if (!isNetworkConnected) {
        // Remove Loader
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      SkyFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      SkyFullScreenLoader.stopLoading();
      SkyLoaders.errorSnackBar(title: 'Error!', message: e.toString());
    }
  }
}
