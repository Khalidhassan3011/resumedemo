import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/api_helper_impl.dart';
import '../../data/chat_api_helper.dart';
import '../../data/chat_api_helper_impl.dart';
import '../../data/interface_controller/api_interface_controller.dart';
import '../cart_controller.dart';
import '../widgets/custom_error_widget.dart';
import 'exports.dart';

class Initializer {
  static const Initializer instance = Initializer._internal();

  factory Initializer() => instance;

  const Initializer._internal();

  void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return CustomErrorWidget(
        message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        printInfo(info: details.stack.toString());
      };

      await _initServices();
      runApp();
    }, (error, stack) {
      // Notify error here
      printInfo(info: 'runZonedGuarded: ${error.toString()}');
      printInfo(info: 'stack: ${stack.toString()}');
    });
  }

  Future<void> _initServices() async {
    try {
      await _initStorage();
      _initScreenPreference();
      _initOther();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> _initStorage() async {
    await GetStorage.init();
  }

  void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initOther(){
    Get.put(AppController(), permanent: true);
    Get.put(CartController(), permanent: true);
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiHelper>(ApiHelperImpl());
    Get.put<ChatApiHelper>(ChatApiHelperImpl());

    Get.put<ApiInterfaceController>(ApiInterfaceController());
  }
}
