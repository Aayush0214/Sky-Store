import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sky_store/data/repositories/authentication/authentication_repository.dart';
import 'package:sky_store/data/repositories/user/user_repository.dart';
import 'package:sky_store/features/authentication/screens/login/login.dart';
import 'package:sky_store/features/personalization/models/user_model.dart';
import 'package:sky_store/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/popups/full_screen_loader.dart';
import 'package:sky_store/utils/popups/loaders.dart';

import '../../../utils/helpers/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First update Rx user and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      // if no record already stored.
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert name to first and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username =
              UserModel.generateUsername(userCredentials.user!.displayName);

          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
            birthDate: '',
          );

          // save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      SkyLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }

  /// Delete Account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(SkySizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: SkySizes.lg),
                child: Text('Delete'))),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  /// Delete user account
  void deleteUserAccount() async {
    try {
      // Loader
      SkyFullScreenLoader.openLoadingDialog('Processing', SkyImages.loading_2);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          SkyFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          SkyFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      SkyFullScreenLoader.stopLoading();
      SkyLoaders.warningSnackBar(
          title: 'What happened?', message: e.toString());
    }
  }

  /// -- Re Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
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
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        SkyFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      SkyFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      SkyFullScreenLoader.stopLoading();
      SkyLoaders.warningSnackBar(
          title: 'What happened?', message: e.toString());
    }
  }

  /// Upload Profile Image
  Future<void> uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        // update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        SkyLoaders.successSnackBar(
            title: 'Congrats', message: 'Your Profile Image has been updated');
      }
    } catch (e) {
      SkyLoaders.errorSnackBar(title: 'What happened?', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
