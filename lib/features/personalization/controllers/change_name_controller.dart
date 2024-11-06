import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/data/repositories/user/user_repository.dart';
import 'package:sky_store/features/personalization/controllers/user_controller.dart';
import 'package:sky_store/features/personalization/screens/profile/profile.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../../utils/helpers/network_manager.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  /// Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> changeNameFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    initializedNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializedNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
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

      // Form Validation
      if (!changeNameFormKey.currentState!.validate()) {
        // Remove Loader
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Update user's credentials
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      SkyFullScreenLoader.stopLoading();

      // Show Success Message
      SkyLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');

      // Move to previous screen
      Get.off(() => const ProfileScreen());
      update();
    } catch (e) {
      // Remove Loader
      SkyFullScreenLoader.stopLoading();
      // show some Generic Error to the user
      SkyLoaders.errorSnackBar(title: 'Oh Error!', message: e.toString());
    }
  }
}
