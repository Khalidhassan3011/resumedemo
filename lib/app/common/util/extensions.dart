import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Extensions {}

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(r);

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
      );

  BorderSide borderSide({
    Color? color,
    double? width,
    BorderStyle? style,
  }) =>
      BorderSide(
        color: color ?? Colors.white,
        width: toDouble(),
        style: style ?? BorderStyle.solid,
      );
}

extension HexColorExt on String {
  Color get fromHex {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff');
    }

    if (startsWith('#')) {
      buffer.write(replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ImageExt on String {
  String get image => 'assets/images/$this.png';

  Image imageAsset({
    Size? size,
    BoxFit? fit,
    Color? color,
  }) =>
      Image.asset(
        this,
        color: color,
        width: size?.width,
        height: size?.height,
        fit: fit,
      );
}

// extension FutureExt<T> on Future<Response<T>?> {
//   void futureValue(
//     Function(T value) response, {
//     Function(String? error)? onError,
//     required VoidCallback retryFunction,
//   }) {
//     final _interface = Get.find<ApiInterfaceController>();
//     _interface.error = null;
//
//     Utils.loadingDialog();
//
//     timeout(
//       Constants.timeout,
//       onTimeout: () {
//         Utils.closeDialog();
//
//         Utils.showSnackbar(Strings.connectionTimeout);
//
//         _retry(_interface, retryFunction);
//
//         throw ApiError(
//           type: ErrorType.connectTimeout,
//           error: Strings.connectionTimeout,
//         );
//       },
//     ).then((value) {
//       if (value?.body != null) {
//         Utils.closeDialog();
//         response(value!.body!);
//       }
//       _interface.update();
//     }).catchError((e, s) {
//       if (e == null) return;
//
//       final String errorMessage = e is ApiError ? e.message : e.toString();
//
//       if (e is ApiError) {
//         if ((e.type == ErrorType.connectTimeout ||
//             e.type == ErrorType.noConnection)) {
//           _interface.error = e;
//
//           _retry(_interface, retryFunction);
//         } else {
//           Utils.showIconDialog(
//             errorMessage,
//             onOkTap: errorMessage != Strings.unauthorized
//                 ? null
//                 : () {
//                     Storage.clearStorage();
//                     Get.offAllNamed(
//                       Routes.splash,
//                       //change the ROUTE to the LOGIN or SPLASH screen so that the
//                       //user can login again on UnAuthorizeError error
//                     );
//                   },
//           );
//         }
//       }
//
//       if (onError != null) {
//         onError(errorMessage);
//       }
//
//       printError(info: 'catchError ->ext: \nerror: $e\nerrorMessage: $errorMessage\n$s');
//     });
//   }
//
//   void _retry(
//     ApiInterfaceController _interface,
//     VoidCallback retryFunction,
//   ) {
//     _interface.retry = retryFunction;
//     _interface.update();
//   }
// }

extension AlignWidgetExt on Widget {
  Widget align({
    Alignment alignment = Alignment.center,
  }) =>
      Align(
        alignment: alignment,
        child: this,
      );
}

extension FormatDurationExt on int {
  String formatDuration() {
    final min = this ~/ 60;
    final sec = this % 60;
    return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")} min";
  }
}

extension DebugLog on String {
  void debugLog() {
    return debugPrint(
      '\n******************************* DebugLog *******************************\n'
      ' $this'
      '\n******************************* DebugLog *******************************\n',
      wrapWidth: 1024,
    );
  }
}

extension PasswordStringValidators on String {
  meetsPasswordRequirements() {
    RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
    RegExp regEx2 = RegExp(r"[0-9]");
    return regEx.hasMatch(this) && regEx2.hasMatch(this);
  }
}

extension EmailFormatValidators on String {
  meetsEmailRequirements() {
    RegExp regEx = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regEx.hasMatch(this);
  }
}

extension GetLastLetter on String {
  getLastLetter() {
    return substring(length - 1);
  }
}

extension RemoveLastLetter on String {
  removeLastLetter() {
    return substring(0, length - 1);
  }
}