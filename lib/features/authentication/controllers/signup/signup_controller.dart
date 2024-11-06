import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/data/repositories/authentication/authentication_repository.dart';
import 'package:sky_store/data/repositories/user/user_repository.dart';
import 'package:sky_store/utils/helpers/network_manager.dart';
import 'package:sky_store/features/personalization/models/user_model.dart';
import 'package:sky_store/features/authentication/screens/signup/verify_email.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/popups/full_screen_loader.dart';
import 'package:sky_store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final firstname = TextEditingController(); // Controller for first name input
  final lastname = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final email = TextEditingController(); // Controller for email input
  final password = TextEditingController(); // Controller for password input
  final birthDate = TextEditingController(); // for date of birth
  final gender = TextEditingController(); // for Gender
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for accepting privacy policy
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for signup form validation

  // Variables for storing phone number
  RxString phoneNumber = ''.obs;
  RxString selectedCountryCode = ''.obs;

  /// Signup
  void signup() async {
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

      // SignUp Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Phone number validation
      if (phoneNumber.value.isEmpty || phoneNumber.value == '') {
        SkyLoaders.warningSnackBar(title: 'Error!', message: 'Phone number is required.');
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy
      if (!privacyPolicy.value) {
        SkyLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of use.',
        );
        // Remove Loader
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authentication user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstname.text.trim(),
        lastName: lastname.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: selectedCountryCode.value + phoneNumber.value,
        birthDate: birthDate.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      SkyFullScreenLoader.stopLoading();

      // Show Success Message
      SkyLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      // Move to verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      SkyFullScreenLoader.stopLoading();
      // show some Generic Error to the user
      SkyLoaders.errorSnackBar(title: 'Oh Error!', message: e.toString());
    }
  }

  /// Function for selecting date
  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      birthDate.text = picked.toString().split(' ')[0];
    }
  }
}
