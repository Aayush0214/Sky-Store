import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// variables
  final pageController = PageController();
  int currentPageIndex = 0;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex = index;

  /// Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex = index;
    pageController.jumpToPage(index);
  }

  /// Update Current Index & Jump to next page
  void nextPage() {
    if (currentPageIndex == 2) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = (currentPageIndex + 1);
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & Jump to the last page
  void skipPage() {
    currentPageIndex = 2;
    pageController.jumpToPage(2);
  }
}
