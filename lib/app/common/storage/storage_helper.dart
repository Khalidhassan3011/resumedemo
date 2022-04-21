import '../../models/user.dart';
import '../constants.dart';
import 'storage.dart';

class StorageHelper {
  static const String loggedIn = "login_status";
  static const String loggedInToken = "jwt_token";
  static const String userLoggedInData = "user_data";
  static const String language = "language";
  static const String chatToken = "chatToken";
  static const String orders = "orders";

  static set setLoggedIn(bool status) => Storage.saveValue(loggedIn, status);
  static bool get isLoggedIn => Storage.getValue<bool>(loggedIn) ?? false;

  static User? get getUserLoggedInData => (Storage.getValue<String>(userLoggedInData) ?? "").isEmpty? null : User.fromRawJson(Storage.getValue<String>(userLoggedInData) ?? "");
  static set setUserLoggedInData(User data) => Storage.saveValue(userLoggedInData, data.toJson().toString());

  static String get getLoggedInToken => Storage.getValue<String>(loggedInToken) ?? "";
  static set setLoggedInToken(String token) => Storage.saveValue(loggedInToken, token);

  static String get getChatToken => Storage.getValue<String>(chatToken) ?? Constants.appInfo.simsimiKey;
  static set setChatToken(String token) => Storage.saveValue(chatToken, token);

  static String get getLanguage => Storage.getValue<String>(language) ?? Constants.language.english;
  static set setLanguage(String lan) => Storage.saveValue(language, lan);

  static set setSavedPaymentMethods(String response) => Storage.saveValue(orders, response);
  static String get getSavedPaymentMethods => Storage.getValue<String>(orders) ?? "";
}
