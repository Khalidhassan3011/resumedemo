import 'package:resumedemo/app/common/util/exports.dart';

import '../../../common/cart_controller.dart';
import '../abstract/cart_page_abstract.dart';

class CartPageController extends GetxController implements CartPageAbstract {

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
  void placeOrderPressed() {
    Get.offNamed(Routes.orderPlace);
    Get.find<CartController>().clearCart();
  }

}
