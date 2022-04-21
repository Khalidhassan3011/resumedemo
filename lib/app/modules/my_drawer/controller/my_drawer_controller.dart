import 'package:flutter_zoom_drawer/config.dart';
import 'package:resumedemo/app/common/util/exports.dart';

import '../abstract/my_drawer_abstract.dart';

class MyDrawerController extends GetxController implements MyDrawerAbstract {
  final zoomDrawerController = ZoomDrawerController();
  final AppController appController = Get.find();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
  }

  void closeDrawer() {
    zoomDrawerController.close!();
  }

  @override
  void onHomeClick() {
    closeDrawer();
  }

  @override
  void onLogoutClick() {
    closeDrawer();
    Helper.methods.logout();
  }

  @override
  void onMyChatClick() {
    Get.toNamed(Routes.chat);
  }

  @override
  void onLanguageChange(String language) {
    Helper.methods.changeLanguage(language);
  }

  @override
  void onSignInPressed() {
    Get.toNamed(Routes.signIn);
  }
}
