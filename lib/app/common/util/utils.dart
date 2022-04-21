import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'exports.dart';

class Utils {
  const Utils._();

  // static void showDialog(
  //   String? message, {
  //   String title = Strings.error,
  //   bool success = false,
  //   VoidCallback? onTap,
  // }) =>
  //     Get.defaultDialog(
  //       barrierDismissible: false,
  //       onWillPop: () async {
  //         Get.back();
  //
  //         onTap?.call();
  //
  //         return true;
  //       },
  //       title: success ? Strings.success : title,
  //       content: Text(
  //         message ?? Strings.somethingWentWrong,
  //         textAlign: TextAlign.center,
  //         maxLines: 6,
  //         style: AppTextStyle.semiBoldStyle.copyWith(
  //           color: AppColors.mineShaft,
  //           fontSize: Dimens.fontSize16,
  //         ),
  //       ),
  //       confirm: Align(
  //         alignment: Alignment.centerRight,
  //         child: CustomInkwellWidget.text(
  //           onTap: () {
  //             Get.back();
  //
  //             onTap?.call();
  //           },
  //           title: Strings.ok,
  //           textStyle: AppTextStyle.buttonTextStyle.copyWith(
  //             fontSize: Dimens.fontSize18,
  //           ),
  //         ),
  //       ),
  //     );

  static void showIconDialog(
    String message, {
    String? title,
    Widget? imageWidget,
    String okText = "OK",
    String cancelText = "CANCEL",
    Function()? onOkTap,
    Function()? onCancelTap,
  }) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(okText),
      onPressed: () {
        onOkTap?.call() ?? Get.back();
      },
    );

    Widget cancelButton = TextButton(
      child: Text(cancelText),
      onPressed: () {
        onCancelTap?.call() ?? Get.back();
      },
    );

    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            imageWidget ?? Image.asset(AppAssets.image.icon, width: 30, height: 30),
            const SizedBox(width: 10),
            Text(
              "app_name".tr,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        content: Text(message),
        actions: [
          okButton,
          if (onCancelTap != null)
            cancelButton,
        ],
      ),
      barrierDismissible: false,
    );
  }

  static void timePicker(
    Function(String time) onSelectTime, {
    TimeOfDay? initialTime,
  }) {
    showTimePicker(
      context: Get.overlayContext!,
      initialTime: initialTime ??
          TimeOfDay.fromDateTime(
            DateTime.now(),
          ),
    ).then((v) {
      // if (v != null) {
      //   final _now = DateTime.now();
      //   final _dateTime = DateTime(
      //     _now.year,
      //     _now.month,
      //     _now.day,
      //     v.hour,
      //     v.minute,
      //   );
      //
      //   onSelectTime(_dateTime.formatedDate(dateFormat: 'hh:mm aa'));
      // }
    });
  }

  static String getRandomString(
    int length, {
    bool isNumber = true,
  }) {
    final _chars = isNumber ? '1234567890' : 'abcdefghijklmnopqrstuvwxyz';
    final _rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(
            _chars.length,
          ),
        ),
      ),
    );
  }

  static void loadingDialog() {
    Utils.closeDialog();

    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      name: 'loadingDialog',
      barrierDismissible: false,
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

  static void showSnackbar(String? message) {
    closeSnackbar();

    Get.rawSnackbar(message: message);
  }

  static void closeKeyboard() {
    final currentFocus = Get.focusScope!;
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void goBackToScreen(String routeName) {
    Get.until((route) => route.settings.name == routeName);
  }

  static Future<void> showImagePicker({
    required Function(File image) onGetImage,
  }) {
    return showModalBottomSheet<void>(
      context: Get.context!,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    getImage(source: 2).then((v) {
                      if (v != null) {
                        onGetImage(v);
                        Get.back();
                      }
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.image,
                        size: 60.w,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        Strings.gallery,
                        textAlign: TextAlign.center,
                        style: Style.textStyle.semiBoldStyle.copyWith(
                          color: AppColors.mineShaft,
                          fontSize: Dimens.fontSize16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    getImage().then((v) {
                      if (v != null) {
                        onGetImage(v);
                        Get.back();
                      }
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera,
                        size: 60.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Strings.camera,
                        textAlign: TextAlign.center,
                        style: Style.textStyle.semiBoldStyle.copyWith(
                          color: AppColors.mineShaft,
                          fontSize: Dimens.fontSize16,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static Future<File?> getImage({int source = 1}) async {
  //   File? croppedFile;
  //   final picker = ImagePicker();
  //
  //   final pickedFile = await picker.pickImage(
  //     source: source == 1 ? ImageSource.camera : ImageSource.gallery,
  //     imageQuality: 60,
  //   );
  //
  //   if (pickedFile != null) {
  //     final image = File(pickedFile.path);
  //
  //     croppedFile = await ImageCropper.cropImage(
  //       compressQuality: 50,
  //       sourcePath: image.path,
  //       aspectRatioPresets: [
  //         CropAspectRatioPreset.square,
  //         // CropAspectRatioPreset.ratio3x2,
  //         // CropAspectRatioPreset.original,
  //         // CropAspectRatioPreset.ratio4x3,
  //         // CropAspectRatioPreset.ratio16x9
  //       ],
  //       androidUiSettings: const AndroidUiSettings(
  //         toolbarColor: Colors.transparent,
  //         toolbarWidgetColor: Colors.transparent,
  //         initAspectRatio: CropAspectRatioPreset.original,
  //         lockAspectRatio: true,
  //       ),
  //       iosUiSettings: const IOSUiSettings(
  //         minimumAspectRatio: 0.1,
  //         aspectRatioLockDimensionSwapEnabled: true,
  //       ),
  //     );
  //   }
  //
  //   return croppedFile;
  }

  static networkImage(String url, {BoxFit fit = BoxFit.contain}) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: fit,
              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
            ),
        ),
      ),
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset(AppAssets.image.icon),
    );
  }

  static Future<bool> appExitConfirmation() async {
    return _appExit ?? false;
  }

  static dynamic get _appExit => showIconDialog(
      "exitAppHints".tr,
      onOkTap: () {
        Utils.closeKeyboard();
        Helper.unFocus;
        Helper.exitApp;
      },
      onCancelTap: () {},
  );
}
