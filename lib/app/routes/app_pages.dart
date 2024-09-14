import 'package:get/get.dart';
import 'package:shop_cart/app/modules/cart/bindings/cart_binding.dart';
import 'package:shop_cart/app/modules/cart/views/cart_view.dart';
import 'package:shop_cart/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:shop_cart/app/modules/dashboard/views/dashboard_view.dart';
import 'package:shop_cart/app/modules/profile/bindings/profile_binding.dart';
import 'package:shop_cart/app/modules/profile/views/profile_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const CARL = Routes.CART;
  static const PROFILE = Routes.PROFILE;
   static const DASHBOARD = Routes.DASHBOARD;

  static final routes = [

     GetPage(
      name: _Paths.DASHBOARD,
      page: () =>  DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
