import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sky_store/features/shop/models/category_model.dart';
import 'package:sky_store/utils/popups/full_screen_loader.dart';
import 'package:sky_store/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result = snapshot.docs
          .map((e) => CategoryModel.fromSnapshot(e))
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Categories to the Cloud Firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Full Screen Loader Animation
      SkyFullScreenLoader.openLoadingDialog(
          'Uploading Data...', SkyImages.uploadData);

      // Check whether categories list is empty or not?
      if (categories.isEmpty) {
        SkyFullScreenLoader.stopLoading();
        SkyLoaders.warningSnackBar(
            title: 'Warning!', message: 'Category List is empty.');
        return;
      }

      // Upload all the categories along with their Images
      final storage = Get.put(SkyFirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // upload image and get its url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        // Assign URL to category image attribute
        category.image = url;

        // Store category to Firestore
        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
      }
      SkyFullScreenLoader.stopLoading();
      SkyLoaders.successSnackBar(title: 'Categories Uploaded.');
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
