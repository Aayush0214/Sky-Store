import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sky_store/features/shop/models/brand_category_model.dart';
import 'package:sky_store/features/shop/models/brand_model.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../services/firebase_storage_service.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// variable
  final _db = FirebaseFirestore.instance;

  /// Get all Brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs
          .map((document) => BrandModel.fromSnapshot(document))
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

  /// Get Brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provides categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in collection
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Brands to the Cloud Firebase
  Future<void> uploadBrands(List<BrandModel> brands) async {
    try {
      // Full Screen Loader Animation
      SkyFullScreenLoader.openLoadingDialog(
          'Uploading Data', SkyImages.uploadData);

      // Check whether categories list is empty or not?
      if (brands.isEmpty) {
        SkyFullScreenLoader.stopLoading();
        SkyLoaders.warningSnackBar(
            title: 'Warning!', message: 'Brand List is empty.');
        return;
      }

      // Upload all the brands along with their Images
      final storage = Get.put(SkyFirebaseStorageService());

      // Loop through each brands
      for (var brand in brands) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(brand.image);

        // upload image and get its url
        final url = await storage.uploadImageData('Brands', file, brand.image);

        // Assign URL to brands image attribute
        brand.image = url;

        // Store brands to Firestore
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
      }
      SkyFullScreenLoader.stopLoading();
      SkyLoaders.successSnackBar(
          title: 'Congratulations.', message: 'Brands Uploaded Successfully.');
    } on FirebaseException catch (e) {
      SkyFullScreenLoader.stopLoading();
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      SkyFullScreenLoader.stopLoading();
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      SkyFullScreenLoader.stopLoading();
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Brands related to categories
  Future<void> uploadBrandsForCategory(
      List<BrandCategoryModel> brandWithCategory) async {
    try {
      // Full Screen Loader Animation
      SkyFullScreenLoader.openLoadingDialog(
          'Uploading Data', SkyImages.uploadData);

      // Check whether categories list is empty or not?
      if (brandWithCategory.isEmpty) {
        SkyFullScreenLoader.stopLoading();
        SkyLoaders.warningSnackBar(
            title: 'Warning!', message: 'BrandCategoryRelation List is empty.');
        return;
      }
      // Loop through each brands
      for (var brand in brandWithCategory) {
        // Store brands relation with category to Firestore
        await _db.collection('BrandCategory').doc().set(brand.toJson());
      }
      SkyFullScreenLoader.stopLoading();
      SkyLoaders.successSnackBar(
          title: 'Congratulations.', message: 'Brands Uploaded Successfully.');
    } on FirebaseException catch (e) {
      SkyFullScreenLoader.stopLoading();
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      SkyFullScreenLoader.stopLoading();
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      SkyFullScreenLoader.stopLoading();
      throw 'Something went wrong. Please try again';
    }
  }
}
