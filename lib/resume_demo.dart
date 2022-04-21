import 'app/common/language/translation.dart';
import 'app/common/util/exports.dart';
import 'app/common/util/initializer.dart';

class ResumeDemo extends GetView<AppController> {
  const ResumeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppController(), permanent: true);
    ScreenUtil.init(
      context,
      orientation: Orientation.portrait,
      deviceSize: Size(Get.width, Get.height),
      designSize: Get.size,
    );

    return GetMaterialApp(
      title: Constants.appInfo.appName,
      navigatorKey: controller.globalKey,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: Locale(StorageHelper.getLanguage),
      fallbackLocale: Locale(StorageHelper.getLanguage),
      theme: AppTheme.light,
      darkTheme: AppTheme.light,
      themeMode: ThemeMode.light,
    );
  }
}