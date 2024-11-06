import 'package:get/get.dart';
import 'package:sky_store/data/repositories/product/product_repository.dart';
import 'package:sky_store/features/shop/models/product_model.dart';
import 'package:sky_store/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxList<ProductModel> allFeaturedProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      /// Show loader white loading products
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      SkyLoaders.errorSnackBar(title: 'What Happened?', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch All Products
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      SkyLoaders.errorSnackBar(title: 'What Happened?', message: e.toString());
      return [];
    }
  }

  // Get the Product price or price range for variations
  String getProductPrice(ProductModel product) {
    return (product.salePrice > 0
            ? product.salePrice.toString()
            : product.price)
        .toString();

    /// This is exception method for showing range wise price of the variation based products.
    /*
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;
    If no variations exists, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0
              ? product.salePrice.toString()
              : product.price)
          .toString();
    }
    else {
      // Calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // If smallest and largest prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // Otherwise, return a price range
        return '$smallestPrice - ₹$largestPrice';
      }
    } */
  }

  // -- Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // -- Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of stock';
  }
}
