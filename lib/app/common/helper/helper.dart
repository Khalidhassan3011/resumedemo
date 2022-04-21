import 'dart:math';

import 'package:flutter/services.dart';
import '../../models/user.dart';
import '../util/exports.dart';
part 'helper_data/helper_data.dart';
part 'helper_methods/helper_methods.dart';


class Helper {
  static _HelperData get data => _HelperData();

  static _HelperMethods get methods => _HelperMethods();

  static void copyToClipboard(String data) {
    Clipboard.setData(ClipboardData(text: data));
  }

  static get exit => SystemChannels.platform.invokeMethod('SystemNavigator.pop');

  static get unFocus => FocusManager.instance.primaryFocus?.unfocus();

  static get exitApp => SystemChannels.platform.invokeMethod('SystemNavigator.pop');

  static List<int> randomNumberWithoutDuplicate(int totalNumber, int max) {
    List<int> _temp = [];

    while(totalNumber > 0){
      int number = Random().nextInt(max);
      if(!_temp.contains(number)) {
        _temp.add(number);
        totalNumber--;
      }
    }

    return _temp;
  }
}
