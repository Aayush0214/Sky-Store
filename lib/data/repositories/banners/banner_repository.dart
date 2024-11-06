import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sky_store/features/shop/models/banner_model.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../services/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all banners
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Banners to the Cloud Firebase
  Future<void> uploadBannerData(List<BannerModel> banners) async {
    try {
      // Full Screen Loader Animation
      SkyFullScreenLoader.openLoadingDialog(
          'Uploading Data', SkyImages.uploadData);

      // Check whether categories list is empty or not?
      if (banners.isEmpty) {
        SkyFullScreenLoader.stopLoading();
        SkyLoaders.warningSnackBar(
            title: 'Warning!', message: 'Banner List is empty.');
        return;
      }

      // Upload all the categories along with their Images
      final storage = Get.put(SkyFirebaseStorageService());

      // Loop through each banner
      for (var banner in banners) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // upload image and get its url
        final url =
            await storage.uploadImageData('Banners', file, banner.imageUrl);

        // Assign URL to banner image attribute
        banner.imageUrl = url;

        // Store banner to Firestore
        await _db.collection('Banners').doc().set(banner.toJson());
      }
      SkyFullScreenLoader.stopLoading();
      SkyLoaders.successSnackBar(
          title: 'Congratulations.', message: 'Banners Uploaded Successfully.');
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
