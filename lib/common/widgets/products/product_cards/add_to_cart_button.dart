import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/features/shop/controllers/product/cart_controller.dart';
import 'package:sky_store/features/shop/models/product_model.dart';
import 'package:sky_store/features/shop/screens/product_details/product_detail.dart';
import 'package:sky_store/utils/constants/enums.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        // If the product have variations then show the product details for variation selection
        // Else add product to the cart
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneItemToCart(cartItem);
        } else {
          Get.to(() => ProductDetail(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCarts(product.id);
        return Container(
          decoration: BoxDecoration(
            color:
                productQuantityInCart > 0 ? SkyColors.primary : SkyColors.dark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SkySizes.cardRadiusMd),
              bottomRight: Radius.circular(SkySizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: SkySizes.iconLg * 1.2,
            height: SkySizes.iconLg * 1.2,
            child: Center(
                child: productQuantityInCart > 0
                    ? Text(productQuantityInCart.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: SkyColors.white))
                    : const Icon(Iconsax.add, color: SkyColors.white)),
          ),
        );
      }),
    );
  }
}
