import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/personalization/models/address_model.dart';
import 'package:sky_store/features/personalization/screens/address/add_new_address.dart';
import 'package:sky_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/sizes.dart';
import 'package:sky_store/utils/helpers/cloud_helper_function.dart';
import 'package:sky_store/utils/helpers/network_manager.dart';
import 'package:sky_store/utils/popups/full_screen_loader.dart';
import 'package:sky_store/utils/popups/loaders.dart';

import '../../../common/widgets/loaders/circular_loader.dart';
import '../../../data/repositories/address/address_repository.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  RxBool refreshData = true.obs;
  final addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  /// Variable for form validation
  final name = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  RxString phoneNumber = ''.obs;
  RxString selectedCountryCode = ''.obs;
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      SkyLoaders.errorSnackBar(
          title: 'Address not found!', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const SkyCircularLoader());

      /// Clear the 'Selected' field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      /// Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      /// Set the 'Selected' field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      SkyLoaders.errorSnackBar(
          title: 'Error is Selection', message: e.toString());
    }
  }

  /// Add new Address
  Future addNewAddresses() async {
    try {
      // Start Loading
      SkyFullScreenLoader.openLoadingDialog(
          'Saving Address', SkyImages.loading_2);

      // Check Internet Connectivity
      final isNetworkConnected = await NetworkManager.instance.isConnected();
      if (!isNetworkConnected) {
        SkyFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        SkyFullScreenLoader.stopLoading();
        return;
      }

      /// phone number validation
      if (phoneNumber.value.isEmpty || phoneNumber.value == '') {
        SkyFullScreenLoader.stopLoading();
        SkyLoaders.warningSnackBar(
            title: 'Error!', message: 'Phone number is required.');
        return;
      }

      // Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text,
        phoneNumber: selectedCountryCode.value + phoneNumber.value,
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      // Update selected address status
      address.id = id;
      await selectAddress(address);

      // Remove Loader
      SkyFullScreenLoader.stopLoading();

      // Show Success Message
      SkyLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully.');

      // Refresh Addresses Data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Loader
      SkyFullScreenLoader.stopLoading();
      SkyLoaders.errorSnackBar(
          title: 'Address not found!', message: e.toString());
    }
  }

  /// Show Addresses ModalBottomSheet or Checkout
  Future<dynamic> selectNewAddressPopUp(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (_) => Container(
              padding: const EdgeInsets.all(SkySizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SkySectionHeading(
                      title: 'Select Address', showActionButton: false),
                  SizedBox(height: SkySizes.sm),
                  FutureBuilder(
                    future: getAllUserAddresses(),
                    builder: (_, snapshot) {
                      /// Helper Function: Handle Loader, No record, Or Error message
                      final response =
                          SkyCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot);
                      if (response != null) return response;

                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => SkySingleAddress(
                          address: snapshot.data![index],
                          onTap: () async {
                            await selectAddress(snapshot.data![index]);
                            Get.back();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const AddNewAddressScreen()),
                        child: const Text('Add new address')),
                  )
                ],
              ),
            ));
  }

  /// Function to reset form fields
  void resetFormFields() {
    name.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState!.reset();
  }
}
