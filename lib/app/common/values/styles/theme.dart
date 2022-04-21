import '../../util/exports.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.colorPrimary,
      scaffoldBackgroundColor: AppColors.colorBg2,
      cardColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75)
          ),
          minimumSize: const Size(250, 50),
        ),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: AppColors.black,
          letterSpacing: -.95,
          wordSpacing: 1.2,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
        bodyText2: TextStyle(
          color: AppColors.colorTextSecondary,
          fontSize: 16,
          wordSpacing: -1,
        ),
        // link text
        headline1: TextStyle(
          color: AppColors.colorTextSecondary,
          letterSpacing: -.95,
          wordSpacing: 1.2,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        // text field hints
        headline2: TextStyle(
          color: AppColors.grey,
          letterSpacing: .7,
          wordSpacing: 1.2,
          fontSize: 15,
        ),
      ),
    );
  }

  static ThemeData get dark {
    return light;
  }
}
