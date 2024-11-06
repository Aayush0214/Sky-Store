import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();
  final RxBool isNetworkConnected = false.obs;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  /// Initialize the network manager and set up a stream to continuously check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _updateConnectionStatus(result);
      Get.appUpdate();
    });
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (result.contains(ConnectivityResult.none)) {
      isNetworkConnected.value = false;
      SkyLoaders.warningSnackBar(
          title: 'No Internet Connection!',
          message: 'Please connect with Internet.');
    } else if (result.contains(ConnectivityResult.mobile)) {
      isNetworkConnected.value = true;
      SkyLoaders.successSnackBar(
          title: 'We are connected.', message: 'Using mobile network.');
      Get.appUpdate();
    } else if (result.contains(ConnectivityResult.wifi)) {
      isNetworkConnected.value = true;
      SkyLoaders.successSnackBar(
          title: 'We are connected.', message: 'Using WiFi.');
      Get.appUpdate();
    }
  }

  /// Check the internet connection status.
  ///  Returns 'true' if connected, 'false' otherwise.
  Future<bool> isConnected() async {
    try {
      return isNetworkConnected.value;
    } on PlatformException catch (_) {
      return isNetworkConnected.value;
    }
  }

  /// Dispose or close the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
