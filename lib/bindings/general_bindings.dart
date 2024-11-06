import 'package:get/get.dart';
import 'package:sky_store/features/personalization/controllers/address_controller.dart';
import 'package:sky_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:sky_store/features/shop/controllers/product/variation_controller.dart';
import 'package:sky_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager(), permanent: true);
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckOutController());
  }
}
