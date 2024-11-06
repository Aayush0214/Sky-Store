import 'package:get/get.dart';
import 'package:sky_store/features/authentication/screens/login/login.dart';
import 'package:sky_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:sky_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:sky_store/features/authentication/screens/signup/signup.dart';
import 'package:sky_store/features/authentication/screens/signup/verify_email.dart';
import 'package:sky_store/features/personalization/screens/address/addresses.dart';
import 'package:sky_store/features/personalization/screens/profile/profile.dart';
import 'package:sky_store/features/personalization/screens/settings/setting_screen.dart';
import 'package:sky_store/features/shop/models/brand_model.dart';
import 'package:sky_store/features/shop/models/category_model.dart';
import 'package:sky_store/features/shop/screens/brand/brand_products.dart';
import 'package:sky_store/features/shop/screens/cart/cart.dart';
import 'package:sky_store/features/shop/screens/checkout/checkout.dart';
import 'package:sky_store/features/shop/screens/home/home_screen.dart';
import 'package:sky_store/features/shop/screens/order/order.dart';
import 'package:sky_store/features/shop/screens/product_details/product_detail.dart';
import 'package:sky_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:sky_store/features/shop/screens/store/store_screen.dart';
import 'package:sky_store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:sky_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:sky_store/routes/routes.dart';

import '../features/shop/models/product_model.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: SkyRouts.home, page: () => const HomeScreen()),
    GetPage(name: SkyRouts.store, page: () => const StoreScreen()),
    GetPage(name: SkyRouts.favourites, page: () => const FavouriteScreen()),
    GetPage(name: SkyRouts.settings, page: () => const SettingScreen()),
    GetPage(
        name: SkyRouts.productReviews,
        page: () => const ProductReviewsScreen()),
    GetPage(name: SkyRouts.order, page: () => const OrderScreen()),
    GetPage(name: SkyRouts.checkout, page: () => const CheckoutScreen()),
    GetPage(name: SkyRouts.cart, page: () => const CartScreen()),
    GetPage(name: SkyRouts.userProfile, page: () => const ProfileScreen()),
    GetPage(name: SkyRouts.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: SkyRouts.signup, page: () => const SignUpScreen()),
    GetPage(name: SkyRouts.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: SkyRouts.signIn, page: () => const LoginScreen()),
    GetPage(
        name: SkyRouts.forgetPassword,
        page: () => const ForgetPasswordScreen()),
    GetPage(name: SkyRouts.onBoarding, page: () => const OnBoardingScreen()),
    //GetPage(name: SkyRouts.allProduct, page: () => const AllProducts()),
    GetPage(
        name: SkyRouts.productDetails,
        page: () => ProductDetail(product: ProductModel.empty())),
    GetPage(
        name: SkyRouts.subCategories,
        page: () => SubCategoriesScreen(category: CategoryModel.empty())),
    GetPage(
        name: SkyRouts.brand,
        page: () => BrandProducts(
              brand: BrandModel.empty(),
            )),
  ];
}
