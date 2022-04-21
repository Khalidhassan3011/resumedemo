import '../../../common/util/exports.dart';
import '../controllers/order_place_page_controller.dart';

class OrderPlacePageView extends GetView<OrderPlacePageController> {
  const OrderPlacePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // image
            Image.asset(
              AppAssets.image.orderSuccess,
              height: 250,
              width: 250,
            ),

            const SizedBox(height: 20),

            // confirmation
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "orderPlaced".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "orderPlacedHints".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ),

            const SizedBox(height: 35),

            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Back to Home".toUpperCase(),
                style: const TextStyle(
                  color: AppColors.colorPrimary,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
