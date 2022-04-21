import 'package:get/get.dart';

import '../modules/cart_page/bindings/cart_page_binding.dart';
import '../modules/cart_page/views/cart_page_view.dart';
import '../modules/chat_page/bindings/chat_page_binding.dart';
import '../modules/chat_page/views/chat_page_view.dart';
import '../modules/dashboard_page/bindings/dashboard_page_binding.dart';
import '../modules/dashboard_page/views/dashboard_page_view.dart';
import '../modules/order_place_page/bindings/order_place_page_binding.dart';
import '../modules/order_place_page/views/order_place_page_view.dart';
import '../modules/page_not_found_page/bindings/page_not_found_page_binding.dart';
import '../modules/page_not_found_page/views/page_not_found_page_view.dart';
import '../modules/signin_page/bindings/signin_page_binding.dart';
import '../modules/signin_page/views/signin_page_view.dart';
import '../modules/splash_page/bindings/splash_page_binding.dart';
import '../modules/splash_page/views/splash_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashPageView(),
      binding: SplashPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.pageNotFound,
      page: () => const PageNotFoundPageView(),
      binding: PageNotFoundPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardPageView(),
      binding: DashboardPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.signIn,
      page: () => const SigninPageView(),
      binding: SigninPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.cart,
      page: () => const CartPageView(),
      binding: CartPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.chat,
      page: () => const ChatPageView(),
      binding: ChatPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.orderPlace,
      page: () => const OrderPlacePageView(),
      binding: OrderPlacePageBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
