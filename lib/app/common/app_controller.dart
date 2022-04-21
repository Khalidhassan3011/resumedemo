import 'package:resumedemo/app/models/user.dart';

import 'util/exports.dart';

class AppController extends GetxController {
  final globalKey = GlobalKey<NavigatorState>();

  RxBool isUserLoggedIn = StorageHelper.isLoggedIn.obs;
  Rx<User> user = User.demoUser().obs;

  RxString selectedLanguage = "".obs;

  @override
  void onInit() {
    super.onInit();

    if(StorageHelper.getUserLoggedInData != null) {
      user.value = StorageHelper.getUserLoggedInData!;
    }

    selectedLanguage.value = StorageHelper.getLanguage;
  }
}
