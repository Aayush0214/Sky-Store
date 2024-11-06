import 'package:get/get.dart';
import 'package:sky_store/data/repositories/banners/banner_repository.dart';
import 'package:sky_store/features/shop/models/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> allBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  /// Update Page Navigational Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  // Fetch Banners
  Future<void> fetchBanner() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch banners from data source (Firestore, API, etc.)
      final banners = await bannerRepository.getAllBanners();

      // Update the banner list
      allBanners.assignAll(banners);
    } catch (e) {
      SkyLoaders.errorSnackBar(title: 'What happened?', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
