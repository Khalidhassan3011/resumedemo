import 'package:resumedemo/app/common/cart_controller.dart';
import 'package:resumedemo/app/common/util/exports.dart';
import 'package:resumedemo/app/models/product.dart';
import 'package:resumedemo/app/modules/my_drawer/controller/my_drawer_controller.dart';

import '../abstract/home_tab_body_abstract.dart';

class HomeTabBodyController extends GetxController implements HomeTabBodyAbstract {

  final ApiHelper _apiHelper = Get.find();

  RxBool initialLoading = false.obs;
  RxBool categoryWiseLoading = false.obs;

  RxList<Product> allProducts = <Product>[].obs;
  RxList<String> allCategory = <String>["All"].obs;

  // store all fetch product based on category
  RxList<RxList<Product>> categoryWiseProduct = <RxList<Product>>[].obs;

  List<int> trendingProduct = [];

  RxString selectedCategory = "All".obs;


  @override
  void onInit() {
    super.onInit();

    _init();
  }

  Future<void> _init() async {
    initialLoading.value = true;
    await _fetchAllProducts();
    await _fetchAllCategories();
    initialLoading.value = false;
  }

  @override
  void onMenuOpenPressed() {
    Get.find<MyDrawerController>().toggleDrawer();
  }

  @override
  void onCartPressed() {
    if(Get.find<CartController>().products.isEmpty) {
      Utils.showSnackbar("emptyCart".tr);
    } else {
      Get.toNamed(Routes.cart);
    }
  }

  @override
  void onCategoryChange(String name) {
    if(selectedCategory.value != name) {
      selectedCategory.value = name;

      if(name != allCategory[0]){
        int index = allCategory.indexOf(name);

        if(categoryWiseProduct[index].isEmpty) {
          _fetchCategoryWiseProducts(index);
        }
      }

    }
  }

  Future<void> _fetchAllProducts() async {
    await _apiHelper.getAllProducts().then((value){
      allProducts.addAll(List<Product>.from(value.body.map((x) => Product.fromJson(x))));
    });
    categoryWiseProduct.add(allProducts);
    trendingProduct = Helper.randomNumberWithoutDuplicate(5, allProducts.length - 1);
  }

  Future<void> _fetchAllCategories() async {
    await _apiHelper.getAllCategory().then((value) {
      for(var element in value.body) {
        allCategory.add(element.toString());
        categoryWiseProduct.add(<Product>[].obs);
      }
    });
  }

  Future<void> _fetchCategoryWiseProducts(int index) async {
    categoryWiseLoading.value = true;
    await _apiHelper.getProductsByCategory(selectedCategory.value).then((value){
      categoryWiseProduct[index].addAll(List<Product>.from(value.body.map((x) => Product.fromJson(x))));
    });
    categoryWiseLoading.value = false;
  }

}