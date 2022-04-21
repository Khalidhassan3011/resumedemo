part of "../helper.dart";

class _HelperMethods {
  void signInSuccessfully(User user, String token) {
    // save value  to local
    StorageHelper.setLoggedInToken = token;
    StorageHelper.setLoggedIn = true;
    // StorageHelper.setUserLoggedInData = user;

    Get.find<AppController>().isUserLoggedIn.value = true;
    Get.find<AppController>().user.value = user;
    Get.find<AppController>().user.refresh();

    // next screen
    Get.offAllNamed(Routes.dashboard);
    Utils.showSnackbar("loginSuccess".tr);
  }

  void logout() {
    Get.find<AppController>().isUserLoggedIn.value = false;
    Storage.clearStorage();
    Get.offAllNamed(Routes.splash);
    Utils.showSnackbar("logoutSuccess".tr);
  }

  void changeLanguage(String language) {
    StorageHelper.setLanguage = language;
    Get.find<AppController>().selectedLanguage.value = language;
    Get.updateLocale(Locale(language));
  }

}
