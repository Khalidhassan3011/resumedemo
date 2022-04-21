import 'package:google_fonts/google_fonts.dart';
import 'package:resumedemo/app/common/cart_controller.dart';
import 'package:resumedemo/app/models/product.dart';

import '../util/exports.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 222,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(child: _image),
            Expanded(child: _details),
          ],
        ),
      ),
    );
  }

  Widget get _image => Container(
    padding: const EdgeInsets.all(8),
    child: Align(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Utils.networkImage(product.image),
      ),
    ),
  );

  Widget get _details => Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: _name,
            ),
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _price,
                  _addToCart,
                ],
              ),
            ),
          ],
        ),
      );

  Widget get _name => Text(
    product.title,
    textAlign: TextAlign.center,
    style: GoogleFonts.inconsolata(
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
  );

  Widget get _price => Text(
    product.price.toStringAsFixed(2),
    style: GoogleFonts.inconsolata(
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),
  );

  Widget get _addToCart => Obx(
    ()=> Visibility(
      visible: !Get.find<CartController>().isProductInCart(product.id),
      child: GestureDetector(
        onTap: () {
          Get.find<CartController>().addToCart(product);
        },
        child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[100],
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: AppColors.colorPrimary,
              ),
            ),
      ),
    ),
  );
}
