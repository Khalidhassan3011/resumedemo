
import '../../../common/util/exports.dart';
import '../abstract/splash_screen_abstract.dart';

class SplashPageController extends GetxController implements SplashScreenAbstract {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    if (StorageHelper.isLoggedIn) {
      Get.toNamed(Routes.dashboard);
    }
  }

  @override
  void onClose() {}

  @override
  void getStartBtnPressed() {
    Get.offAndToNamed(Routes.dashboard);
  }

  @override
  void signInBtnPressed() {
    Get.toNamed(Routes.signIn);
  }
}
