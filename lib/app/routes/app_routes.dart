part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const pageNotFound = _Paths.pageNotFound;
  static const dashboard = _Paths.dashboard;
  static const signIn = _Paths.signIn;
  static const cart = _Paths.cart;
  static const order = _Paths.order;
  static const chat = _Paths.chat;
  static const orderPlace = _Paths.orderPlace;
}

abstract class _Paths {
  _Paths._();
  static const splash = '/splash-page';
  static const pageNotFound = '/page-not-found-page';
  static const dashboard = '/dashboard-page';
  static const signIn = '/sign-in-page';
  static const cart = '/cart-page';
  static const order = '/order-page';
  static const chat = '/chat-page';
  static const orderPlace = '/order-place-page';
}
