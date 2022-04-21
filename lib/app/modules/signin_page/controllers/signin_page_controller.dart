import 'package:resumedemo/app/common/util/validators.dart';
import 'package:resumedemo/app/models/user.dart';

import '../../../common/util/exports.dart';
import '../abstract/signin_page_view_abstract.dart';

class SigninPageController extends GetxController implements SignInPageViewAbstract {

  final ApiHelper _apiHelper = Get.find();

  RxList<User> users = <User>[].obs;

  User? selectedUser;

  final tecUsername = TextEditingController().obs;
  final tecPassword = TextEditingController().obs;

  RxBool loading = false.obs;

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
  void onInputFieldTap() {
    if(users.isEmpty){
      _getUsers();
    }
  }

  @override
  void onUserSelected(User user) {
    selectedUser = user;

    Get.back();
    tecUsername.value.text = user.username;
    tecPassword.value.text = user.password;
  }

  Future<void> _getUsers() async {
    if(loading.value) {
      return;
    }

    loading.value = true;
    await _apiHelper.getAllUsers().then((value) {
      users.addAll(List<User>.from(value.body.map((x) => User.fromJson(x))));
    });
    loading.value = false;
  }

  @override
  void onSignInPressed() {
    if (Validators.isLoginCredValid(tecUsername.value.text, tecPassword.value.text)) {
      _signIn();
    } else {
      Utils.showSnackbar("invalidAuthCred".tr);
    }
  }

  Future<void> _signIn() async {
    Utils.loadingDialog();

    await _apiHelper.signIn(selectedUser!).then((value) {
      if(value.isOk) {
        Helper.methods.signInSuccessfully(selectedUser!, value.body["token"]);
      } else {
        Utils.showSnackbar("loginFailed".tr);
      }
    });

    Utils.closeDialog();
  }
}
