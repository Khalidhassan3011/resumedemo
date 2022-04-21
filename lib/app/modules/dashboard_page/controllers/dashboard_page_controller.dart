import '../../../common/util/exports.dart';

import '../../my_drawer/controller/my_drawer_controller.dart';
import '../abstract/dashboard_page_abstract.dart';

class DashboardPageController extends GetxController implements DashboardPageAbstract {

  MyDrawerController drawerController = Get.put(MyDrawerController());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  void onMenuOpenPressed() {
    drawerController.toggleDrawer();
  }
}
