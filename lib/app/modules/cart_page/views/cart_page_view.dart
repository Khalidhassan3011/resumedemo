import 'package:resumedemo/app/common/cart_controller.dart';
import 'package:resumedemo/app/models/product.dart';

import '../../../common/util/exports.dart';
import '../controllers/cart_page_controller.dart';

class CartPageView extends GetView<CartPageController> {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: AppColors.colorPrimary,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(child: _items),
          _receipt,
        ],
      ),
    );
  }

  Widget get _items => Obx(
        () => ListView.builder(
            itemCount: Get.find<CartController>().products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _item(Get.find<CartController>().products[index]);
            }),
      );

  Widget _item(Product product) => Container(
    height: 130,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16).copyWith(
          bottom: 0
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(flex: 4, child: _image(product.image)),
            Expanded(flex: 6, child: _details(product)),
          ],
        ),
      );

  Widget _image(String url) => Container(
    margin: const EdgeInsets.all(7),
    padding: const EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: AppColors.grey.withOpacity(.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Utils.networkImage(url),
  );

  Widget _details(Product product) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name
          Text(product.title),

          //price
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              product.price.toString(),
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

          // counter
          _counter(product),
        ],
      );

  Widget _counter(Product product) => Row(
        children: [
          GestureDetector(
            onTap: () => Get.find<CartController>().updateQuantity(product, -1),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(),
              ),
              child: const Center(
                child: Text("-",style: TextStyle(
                  fontSize: 16,
                ),),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              product.quantity.toString(),
            ),
          ),

          GestureDetector(
            onTap: () => Get.find<CartController>().updateQuantity(product, 1),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(),
              ),
              child: const Center(
                child: Text("+",style: TextStyle(
                  fontSize: 16,
                ),),
              ),
            ),
          ),
        ],
      );

  Widget get _receipt => Container(
        height: Get.height * .1,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Obx(
                  () => Text(
                    Get.find<CartController>().subtotal.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            _placeOrder,
          ],
        ),
      );

  Widget get _placeOrder => SizedBox(
        width: Get.width / 2,
        child: ElevatedButton(
          onPressed: controller.placeOrderPressed,
          child: Text("placeOrder".tr.toUpperCase()),
          style: Style.buttonStyle.darkBg,
        ),
      );
}
