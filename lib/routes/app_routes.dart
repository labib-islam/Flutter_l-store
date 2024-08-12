import 'package:flutter_l_store/features/authentication/screens/login/login.dart';
import 'package:flutter_l_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_l_store/features/authentication/screens/signup/signup.dart';
import 'package:flutter_l_store/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_l_store/features/personalization/screens/address/address.dart';
import 'package:flutter_l_store/features/personalization/screens/profile/profile.dart';
import 'package:flutter_l_store/features/personalization/screens/settings/settings.dart';
import 'package:flutter_l_store/features/shop/screens/cart/cart.dart';
import 'package:flutter_l_store/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_l_store/features/shop/screens/home/home.dart';
import 'package:flutter_l_store/features/shop/screens/order/order.dart';
import 'package:flutter_l_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter_l_store/features/shop/screens/store/store.dart';
import 'package:flutter_l_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:flutter_l_store/routes/routes.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/password_configuration/forget_password.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: LRoutes.home, page: () => const HomeScreen()),
    GetPage(name: LRoutes.store, page: () => const StoreScreen()),
    GetPage(name: LRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: LRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: LRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: LRoutes.order, page: () => const OrderScreen()),
    GetPage(name: LRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: LRoutes.cart, page: () => const CartScreen()),
    GetPage(name: LRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: LRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: LRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: LRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: LRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: LRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: LRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}