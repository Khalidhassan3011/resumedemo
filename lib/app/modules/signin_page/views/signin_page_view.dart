import 'package:resumedemo/app/models/user.dart';

import '../../../common/util/exports.dart';
import '../../../common/widgets/custom_app_icon.dart';
import '../controllers/signin_page_controller.dart';

class SigninPageView extends GetView<SigninPageController> {
  const SigninPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Style.other.colorfulBg,
        child: Column(
          children: [
            const Expanded(flex: 3, child: CustomAppIcon()),
            Expanded(
              flex: 7,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                child: Column(
                  children: [
                    const Spacer(),

                    _phoneField,

                    const SizedBox(height: 15),

                    _passwordFiled,

                    const SizedBox(height: 50),

                    _signInBtn,

                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _phoneField => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Obx(
          () => TextField(
            controller: controller.tecUsername.value,
            readOnly: true,
            decoration: Style.other.inputDecoration.copyWith(
              labelText: "Username",
            ),
            onTap: _chooseUser,
          ),
        ),
      );

  Widget get _passwordFiled => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Obx(
          () => TextField(
            controller: controller.tecPassword.value,
            readOnly: true,
            decoration: Style.other.inputDecoration.copyWith(
              labelText: "Password",
            ),
            onTap: _chooseUser,
          ),
        ),
      );

  Widget get _signInBtn => SizedBox(
    width: Get.width / 2,
    child: ElevatedButton(
      onPressed: controller.onSignInPressed,
      child: Text("signIn".tr.toUpperCase()),
      style: Style.buttonStyle.darkBg,
    ),
  );

  void _chooseUser() {
    controller.onInputFieldTap();

    Get.bottomSheet(
      Card(
        child: Container(
          height: 400,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Obx(
            () => controller.loading.value
                ? const Center(child: CircularProgressIndicator())
                : _showUsers(),
          ),
        ),
      ),
      barrierColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
    );
  }

  Widget _showUsers() {
    List<Widget> _allUsers = [];

    for (var element in controller.users) {
      _allUsers.add(_user(element));
    }

    return ListView(
      children: _allUsers,
    );
  }

  Widget _user(User element) => GestureDetector(
    onTap: () => controller.onUserSelected(element),
    child: Container(
          margin: const EdgeInsets.symmetric(vertical: 13),
          child: Row(
            children: [
              _id(element.id),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _name("${element.name.firstname} ${element.name.lastname}"),
                          const SizedBox(height: 3),
                          _phone(element.phone),
                          const SizedBox(height: 5),
                          _email(element.email),
                        ],
                      ),
                    ),
                    _cred(element.username, element.password),
                  ],
                ),
              ),
            ],
          ),
        ),
  );

  Widget _id(int id) => Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: AppColors.colorPrimary,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white),
        ),
        child: Center(
          child: Text(
            id.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _name(String name) => Text(
    name,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );

  Widget _email(String email) => Text(
        email,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black54,
        ),
      );

  Widget _phone(String phone) => Text(
    phone.toString(),
    style: const TextStyle(
      fontSize: 9,
      color: Colors.black54,
    ),
  );

  Widget _cred(String username, String password) => Row(
    children: [
      _pill("Username", username),
      const SizedBox(height: 10),
      _pill("Password", password),
    ],
  );

  Widget _pill(String title, String text) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 8,
          ),
        ),
        const SizedBox(height: 2),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.colorPrimary,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
