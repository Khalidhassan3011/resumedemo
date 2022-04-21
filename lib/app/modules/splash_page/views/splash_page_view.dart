import '../../../common/util/exports.dart';
import '../controllers/splash_page_controller.dart';

class SplashPageView extends GetView<SplashPageController> {
  const SplashPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.image.splashBg),
            fit: BoxFit.fill,
          ),
        ),
        // get start and sign in button
        child: Column(
          children: [
            // all button in bottom
            const Spacer(),

            // get started
            _getStartedBtn,

            // sign in
            _signInBtn,

            // bottom space
            SizedBox(height: Get.height * .15),
          ],
        ),
      ),
    );
  }

  Widget get _getStartedBtn => SizedBox(
        width: Get.width / 2,
        child: ElevatedButton(
          onPressed: controller.getStartBtnPressed,
          child: Text("getStarted".tr.toUpperCase()),
          style: Style.buttonStyle.lightBg,
        ),
      );

  Widget get _signInBtn => TextButton(
        onPressed: controller.signInBtnPressed,
        child: Text(
          "signIn".tr.toUpperCase(),
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
      );
}
