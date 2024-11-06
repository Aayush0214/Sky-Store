import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_store/common/widgets/text/section_heading.dart';
import 'package:sky_store/features/shop/models/payment_method_model.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/utils/constants/sizes.dart';

import '../../../../common/widgets/payment/payment_tile.dart';

class CheckOutController extends GetxController {
  static CheckOutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: SkyImages.payPal, name: 'PayPal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(SkySizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkySectionHeading(title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: SkySizes.spaceBtwSections),
              SkyPaymentTile(paymentMethod: PaymentMethodModel(name: 'PayPal', image: SkyImages.payPal)),
              const SizedBox(height: SkySizes.spaceBtwSections / 2),
              SkyPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: SkyImages.applePay)),
              const SizedBox(height: SkySizes.spaceBtwSections / 2),
              SkyPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: SkyImages.googlePay)),
              const SizedBox(height: SkySizes.spaceBtwSections / 2),
              SkyPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: SkyImages.paytm)),
              const SizedBox(height: SkySizes.spaceBtwSections / 2),
              SkyPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: SkyImages.visa)),
              const SizedBox(height: SkySizes.spaceBtwSections / 2),
              SkyPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: SkyImages.masterCard)),
              const SizedBox(height: SkySizes.spaceBtwSections / 2),
              SkyPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: SkyImages.creditCard)),
              const SizedBox(height: SkySizes.spaceBtwSections / 2),
              SkyPaymentTile(paymentMethod: PaymentMethodModel(name: 'Cash On Delivery', image: SkyImages.COD)),
              const SizedBox(height: SkySizes.spaceBtwSections / 2),
            ],
          ),
        ),
      ),
    );
  }
}
