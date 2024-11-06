import 'dart:convert';

import 'package:get/get.dart';
import 'package:sky_store/data/repositories/product/product_repository.dart';
import 'package:sky_store/features/shop/models/product_model.dart';
import 'package:sky_store/utils/local_storage/storage_utility.dart';
import 'package:sky_store/utils/popups/loaders.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  // variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    initFavourites();
    super.onInit();
  }

  // Method to initialize favourites by reading from storage
  Future<void> initFavourites() async {
    final json = SkyLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      SkyLoaders.customToast(message: 'Item has been added to Wishlist.');
    } else {
      SkyLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      SkyLoaders.customToast(
          message: 'Product has been removed from the WishList.');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    SkyLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favourites.keys.toList());
  }
}
