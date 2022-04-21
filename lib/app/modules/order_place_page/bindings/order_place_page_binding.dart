import 'package:get/get.dart';

import '../controllers/order_place_page_controller.dart';

class OrderPlacePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderPlacePageController>(
      () => OrderPlacePageController(),
    );
  }
}
