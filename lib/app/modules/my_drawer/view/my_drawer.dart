import '../../../common/util/exports.dart';
import '../controller/my_drawer_controller.dart';

class MyDrawer extends GetView<MyDrawerController> {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fullNameFirstLetter,

        const SizedBox(height: 20),

        _fullName,

        const SizedBox(height: 7),

        _email,

        const SizedBox(height: 50),

        _item(Icons.home_outlined, "Home", controller.onHomeClick),
        // _item(Icons.shopping_cart_outlined, "My Cart", controller.onMyCartClick),
        // _item(Icons.receipt_long_outlined, "My Orders", controller.onMyOrdersClick),
        // _item(Icons.person_outline, "My Account", controller.onMyAccountClick),
        _item(Icons.chat_bubble_outline, "My Chats", controller.onMyChatClick),

        const SizedBox(height: 20),

        _language(),

        const SizedBox(height: 50),

        _login,

        _logout,

        _appVersion,
      ],
    );
  }

  Widget get _fullNameFirstLetter => Container(
        width: 85,
        height: 85,
        margin: const EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white),
          color: AppColors.white.withOpacity(.7),
        ),
        child: Center(
          child: Obx(
            ()=> Text(
              "${controller.appController.user.value.name.firstname[0]}${controller.appController.user.value.name.lastname[0]}".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: AppColors.colorPrimary,
              ),
            ),
          ),
        ),
      );

  Widget get _fullName => Container(
    margin: const EdgeInsets.only(left: 30),
    child: Text(
      "${controller.appController.user.value.name.firstname} ${controller.appController.user.value.name.lastname}".capitalize!,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
  );

  Widget get _email => Container(
    margin: const EdgeInsets.only(left: 30),
    child: Text(
      controller.appController.user.value.email,
      style: const TextStyle(
        fontSize: 15,
        color: AppColors.white,
      ),
    ),
  );

  Widget _item(IconData icon, String name, Function() onTap) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Icon(icon, color: AppColors.white, size: 20),
              const SizedBox(width: 20),
              Text(
                name,
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      );


  Widget _language() => Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 15,
    ),
    child: Row(
      children: [
        const Icon(Icons.language, color: AppColors.white, size: 20),
        const SizedBox(width: 20),
        Text(
          "language".tr,
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),

        const SizedBox(width: 30),

        _languages,
      ],
    ),
  );

  Widget get _languages => Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
        ),
        child: Row(
          children: [
            Obx(
              () => GestureDetector(
                onTap: () => controller.onLanguageChange(Constants.language.english),
                child: Container(
                  decoration: BoxDecoration(
                      color: controller.appController.selectedLanguage.value == Constants.language.english
                          ? AppColors.white
                          : AppColors.colorPrimary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    child: Text(
                      "ENG",
                      style: TextStyle(
                          color: controller.appController.selectedLanguage.value == Constants.language.english
                              ? AppColors.colorPrimary
                              : AppColors.white.withOpacity(.7)),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () => controller.onLanguageChange(Constants.language.bangla),
                child: Container(
                  decoration: BoxDecoration(
                      color: controller.appController.selectedLanguage.value == Constants.language.bangla
                          ? AppColors.white
                          : AppColors.colorPrimary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Text(
                      "বাংলা",
                      style: TextStyle(
                          color: controller.appController.selectedLanguage.value == Constants.language.bangla
                              ? AppColors.colorPrimary
                              : AppColors.white.withOpacity(.7)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget get _logout => Obx(
    ()=> Visibility(
          visible: controller.appController.isUserLoggedIn.value,
          child: GestureDetector(
            onTap: controller.onLogoutClick,
            child: Container(
              height: 50,
              width: Get.width / 2,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
              child: Center(
                child: Text(
                  "Logout".toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.colorPrimary,
                  ),
                ),
              ),
            ),
          ),
        ),
  );

  Widget get _login => Obx(
    ()=> Visibility(
      visible: !controller.appController.isUserLoggedIn.value,
      child: Container(
        margin: const EdgeInsets.only(left: 30),
        child: SizedBox(
          width: Get.width / 2,
          child: ElevatedButton(
            onPressed: controller.onSignInPressed,
            child: Text("signIn".tr.toUpperCase()),
            style: Style.buttonStyle.lightBg,
          ),
        ),
      ),
    ),
  );

  Widget get _appVersion => Container(
        margin: const EdgeInsets.only(left: 40, top: 30),
        child: Text(
          "V"+Constants.appInfo.appVersion,
          style: const TextStyle(color: AppColors.colorWhite),
        ),
      );
}
