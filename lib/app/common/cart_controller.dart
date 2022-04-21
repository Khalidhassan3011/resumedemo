import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  // all products in cart
  // define obs because
  // product will be add or remove from [products]
  // product quantity will be update in [products].
  // so if any change of [products] then
  // product item ui will update automatically
  RxList<Product> products = <Product>[].obs;

  // total subtotal
  // subtotal calculate with discounted price
  // ex:
  // product 1: regular price 100, discounted price 0
  // product 2: regular price 100, discounted price 95
  // product 3: regular price 100, discount percent 10%
  // subtotal = product 1(regular price 100) +
  //            product 2(discounted price 95) +
  //            product 3(discounted percent (100 - 10 = 90))
  //          = 285
  RxDouble subtotal = 0.0.obs;

  bool isProductInCart(int id) {
    return getProductById(id) != null;
  }

  Product? getProductById(int id) {
    for (Product product in products) {
      if (product.id == id) {
        return product;
      }
    }
    return null;
  }

  int getSingleProductQuantity(int id) {
    return getProductById(id)?.quantity ?? 0;
  }

  // add to cart
  void addToCart(
    // product
    Product product, {
    // default quantity is 1
    int quantity = 1,
  }) {
    // add product in cart
    products.add(product
      ..quantity = quantity);

    // update ui like quantity, cart button..
    // update subtotal
    // save cart item in local
    _updateUi();
  }

  // remove from cart
  void removeFromCart(Product product) {
    // remove from cart
    for (int i = 0, len = products.length; i < len; i++) {
      if (product.id == products[i].id) {
        products.removeAt(i);
        break;
      }
    }

    // update ui like quantity, cart button..
    // update subtotal
    // save cart item in local
    _updateUi();
  }

  // add or remove quantity
  // when click + then quantity is +1
  // when click - then quantity is -1
  void updateQuantity(Product product, int quantity,{int? custom}) {
    for (int i = 0, len = products.length; i < len; i++) {
      if (product.id == products[i].id) {
        // when buy quantity is 0 then remove item from cart
        if (products[i].quantity + quantity <= 0) {
          products.removeAt(i);
        }
        else if(custom != null){
          products[i].quantity = custom;
        }
        // add or remove item
        else if (products[i].quantity + quantity > 0) {
          products[i].quantity += quantity;
        }
        break;
      }
    }

    // update ui like quantity, cart button..
    // update subtotal
    // save cart item in local
    _updateUi();
  }

  void _updateUi() {
    // Get.find<AppController>().facebookAppEvents.logEvent(
    //   name: 'button_clicked',
    //   parameters: {
    //     'button_id': 'the_clickme_button',
    //   },
    // );

    // calculate subtotal
    _calculateSubtotal();

    // update all ui
    products.refresh();
  }

  void _calculateSubtotal() {
    subtotal.value = 0.0;
    for (Product product in products) {
      subtotal.value += product.quantity * product.price;
    }
  }

  double singleProductSubtotal(int id) {
    Product? _product = getProductById(id);
    if (_product != null) {
      return _product.price * _product.quantity;
    }
    return 0.0;
  }

  void clearCart() {
    // remove all products from cart
    products.clear();

    subtotal.value = 0;

    // update ui like quantity, cart button..
    // update subtotal
    // save cart item in local
    _updateUi();
  }

  void addLocalProductsInCart(List<Product> list) {
    for (Product product in list) {
      products.add(product..quantity = 1);
    }
    _updateUi();
  }
}
