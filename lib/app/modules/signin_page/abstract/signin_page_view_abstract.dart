import '../../../models/user.dart';

abstract class SignInPageViewAbstract {
  void onSignInPressed();

  void onInputFieldTap();

  void onUserSelected(User user);
}
