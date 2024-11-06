import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sky_store/data/repositories/user/user_repository.dart';
import 'package:sky_store/features/authentication/screens/login/login.dart';
import 'package:sky_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:sky_store/features/authentication/screens/signup/verify_email.dart';
import 'package:sky_store/navigation_menu.dart';
import 'package:sky_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:sky_store/utils/exceptions/firebase_exceptions.dart';
import 'package:sky_store/utils/exceptions/format_exceptions.dart';
import 'package:sky_store/utils/exceptions/platform_exceptions.dart';
import 'package:sky_store/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        // Initialize User Specific Storage
        await SkyLocalStorage.init(user.uid);

        // If the user's email is verified, navigate to the main navigation menu.
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

/* --------------------------- Email & Password sing-in --------------------------*/

  /// [EmailAuthentication] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SkyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SkyFormatException();
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SkyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SkyFormatException();
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw SkyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SkyFormatException();
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw SkyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SkyFormatException();
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw SkyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SkyFormatException();
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

/* --------------------------- Federated identity & social sign-in  --------------------------*/

  /// [GoogleAuthentication] - Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the userCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw SkyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SkyFormatException();
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [FacebookAuthentication] - Facebook

/* --------------------------- ./end Federated identity & social sign-in  --------------------------*/

  /// [LogOutUser] - Valid for any authentication
  Future<void> logOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw SkyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SkyFormatException();
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Delete User] - Remove user Auth and Firestore Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw SkyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SkyFormatException();
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
