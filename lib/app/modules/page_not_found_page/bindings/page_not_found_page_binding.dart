import 'package:get/get.dart';

import '../controllers/page_not_found_page_controller.dart';

class PageNotFoundPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageNotFoundPageController>(
      () => PageNotFoundPageController(),
    );
  }
}
