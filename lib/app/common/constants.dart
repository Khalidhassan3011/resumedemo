class Constants {
  const Constants._();

  static const String baseUrl = 'https://fakestoreapi.com/';
  static const String chatBaseUrl = 'https://wsapi.simsimi.com/190410/';

  static const timeout = Duration(seconds: 120);
  static const String token = 'authToken';

  static _AppInfo get appInfo => _AppInfo();

  static _Language get language => _Language();

  static _External get external => _External();

  static _Sign get sign => _Sign();

  static _ErrorConstants get errorConstants => _ErrorConstants();
}

class _AppInfo {
  String appName = "Resume Demo";
  String appVersion = "0.0.0.1";
  String simsimiKey = "v.gMm.3yraEkcHfSuZHYCDyjqDMjpK60pOz~SZX1";
}

class _Language {
  String bangla = "bn";
  String english = "en";
}

class _External {
  String terms = "https://demo.xyz/terms";
  String privacy = "https://demo.com/privacy";
  String faq = "https://demo.com/support";
  String email = "support@support.com";
}

class _Sign {
  String tkSign = "৳";
}

class _ErrorConstants {
  String userNotFound = "user_not_found";
  int unAuthorized = 401;
  int loginUnAuthorized = 418;
  int resourceNotFound = 404;
  int imUsed = 226;
}
