import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sky_store/features/shop/models/product_category_model.dart';
import 'package:sky_store/features/shop/models/product_model.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../services/firebase_storage_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(20)
          .get();
      return snapshot.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get all featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get favourite products details
  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Products based on the Query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Products based on the Brand
  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final snapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();
      final products = snapshot.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Products based on the category
  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      // Query to get all documents where productId matches the provided categoryId & fetch limited or unlimited data based on limit
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      // Extract productIds from the documents
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query document in collection
      final productsQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Extract brand names or other relevant data from the documents
      List<ProductModel> products = productsQuery.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw SkyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SkyPlatformException(e.code).message;
    } catch (e) {
      throw 'Unknown error occurred. Please try again';
    }
  }

  /// Upload Product related to categories
  Future<void> uploadProductForCategory(
      List<ProductCategoryModel> productWithCategory) async {
    try {
      // Full Screen Loader Animation
      SkyFullScreenLoader.openLoadingDialog(
          'Uploading Data', SkyImages.uploadData);

      // Check whether categories list is empty or not?
      if (productWithCategory.isEmpty) {
        SkyFullScreenLoader.stopLoading();
        SkyLoaders.warningSnackBar(
            title: 'Warning!',
            message: 'ProductCategoryRelation List is empty.');
        return;
      }
      // Loop through each brands
      for (var product in productWithCategory) {
        // Store product relation with category to Firestore
        await _db.collection('ProductCategory').doc().set(product.toJson());
      }
      SkyFullScreenLoader.stopLoading();
      SkyLoaders.successSnackBar(
          title: 'Congratulations.',
          message: 'Products and Category relation Uploaded Successfully.');
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

  /// Upload Products to the Cloud Firestore
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Full Screen Loader Animation
      SkyFullScreenLoader.openLoadingDialog(
          'Uploading Data...', SkyImages.uploadData);

      // Check whether categories list is empty or not?
      if (products.isEmpty) {
        SkyFullScreenLoader.stopLoading();
        SkyLoaders.warningSnackBar(
            title: 'Warning!', message: 'Product List is empty.');
        return;
      }

      // Upload all the categories along with their Images
      final storage = Get.put(SkyFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get ImageData link from the local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // upload image and get its url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product image attribute
        product.thumbnail = url;

        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // Assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        // Store product to Firestore
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
      SkyFullScreenLoader.stopLoading();
      SkyLoaders.successSnackBar(title: 'Product Uploaded Successfully.');
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
