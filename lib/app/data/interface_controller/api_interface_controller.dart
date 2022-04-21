import 'package:resumedemo/app/data/errors/api_error.dart';

import '../../common/util/exports.dart';

class ApiInterfaceController extends GetxController {
  ApiError? error;

  VoidCallback? retry;

  void onRetryTap() {
    error = null;
    retry?.call();
    update();
  }
}
