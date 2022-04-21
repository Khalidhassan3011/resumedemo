import 'package:google_fonts/google_fonts.dart';
import 'package:resumedemo/app/common/cart_controller.dart';
import 'package:resumedemo/app/common/widgets/product_item.dart';

import '../../../../common/util/exports.dart';
import '../controller/home_tab_body_controller.dart';

class HomeTabBodyView extends GetView<HomeTabBodyController> {
  const HomeTabBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeTabBodyController());
    return Container(
      height: Get.height - Dimens.ui.bottomNavHeight / 1.8,
      padding: const EdgeInsets.only(bottom: 10),
      decoration: Style.other.tabBodyBg,
      child: Column(
        children: [
          _appbar,
          Expanded(
            child: Obx(
              () => controller.initialLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        _title("trending products"),
                        _trendingProducts,
                        const SizedBox(height: 10),
                        _title("popular categories"),
                        const SizedBox(height: 10),
                        _category,
                        const SizedBox(height: 30),
                        _categoryWiseProducts,
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _appbar => AppBar(
    backgroundColor: AppColors.white,
    bottomOpacity: 0.0,
    elevation: 0.5,
        centerTitle: true,
        title: Text(
          Constants.appInfo.appName,
          style: const TextStyle(color: AppColors.black),
        ),
        leading: IconButton(
      icon: const Icon(Icons.menu_open, color: AppColors.black),
      onPressed: controller.onMenuOpenPressed,
    ),
    actions: [
      Obx(
        ()=> Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: AppColors.black),
              onPressed: controller.onCartPressed,
            ),

            Visibility(
              visible: Get.find<CartController>().products.isNotEmpty,
              child: Positioned(
                right: 12,
                top: 3,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.colorPrimary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                      Get.find<CartController>().products.length.toString(),
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );

  Widget _title(String name) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          children: [
            Text(
              name.toUpperCase(),
              style: GoogleFonts.inconsolata(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Divider(),
              ),
            ),
          ],
        ),
      );

  Widget get _trendingProducts => SizedBox(
        height: 290,
        child: ListView.builder(
            itemCount: controller.trendingProduct.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Obx(
                () => ProductItem(
                  product:
                      controller.allProducts[controller.trendingProduct[index]],
                ),
              );
            }),
      );

  Widget get _category => SizedBox(
        height: 30,
        child: ListView.builder(
            itemCount: controller.allCategory.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _categoryItem(controller.allCategory[index]);
            }),
      );

  Widget _categoryItem(String name) => Obx(
        () => GestureDetector(
          onTap: () => controller.onCategoryChange(name),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: controller.selectedCategory.value == name
                  ? AppColors.colorPrimary
                  : AppColors.grey.withOpacity(.2),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  color: controller.selectedCategory.value == name
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _categoryWiseProducts => SizedBox(
        height: 290,
        child: Obx(
          () => controller.categoryWiseLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller
                      .categoryWiseProduct[controller.allCategory
                          .indexOf(controller.selectedCategory.value)]
                      .length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => ProductItem(
                          product: controller.categoryWiseProduct[controller
                                  .allCategory
                                  .indexOf(controller.selectedCategory.value)]
                              [index]),
                    );
                  }),
        ),
      );
}
