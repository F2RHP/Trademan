// ignore_for_file: non_constant_identifier_names

import 'package:trader_app/env/links.dart';
import 'package:trader_app/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/products/productdetailsBinding.dart';
import '../screens/products/productsdetails.dart';

class AppRouting {
  static final ROUTES = [
    GetPage(
      name: AppLinks.SPLASHSCREEN,
      page: () => const SplashScreen(),
    ),
          GetPage(
        name: AppLinks.PRODUCTS,
        page: () => const ProductDetails(),
        transition: Transition.circularReveal,
        binding: ProductDetailsBinding()),
  ];
}
