import 'package:get/get.dart';

import 'bn_bd.dart';
import 'en_us.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "bn": bn,
      };
}
