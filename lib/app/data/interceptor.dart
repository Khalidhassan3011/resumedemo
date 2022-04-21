import 'dart:async';
import 'dart:convert';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../common/util/exports.dart';
import 'errors/api_error.dart';

FutureOr interceptor(
  GetHttpClient httpClient,
  Request request,
  Response response,
) {
  Utils.closeDialog();

  Get.printInfo(
    info: '\nStatus Code: ${response.statusCode} ║ ${response.statusText}\n'
        'Data: ${response.bodyString?.toString() ?? 'DATA NOT FOUND'}',
  );

  final status = response.status;

  if (status.connectionError) {
    showError(ApiError(
      type: ErrorType.noConnection,
      error: Strings.noConnection,
    ));
  }

  try {
    final res = jsonDecode(response.bodyString!);

    // error check
    if (response.statusCode == 404) {
      Get.toNamed(Routes.pageNotFound);
      return response;
    }
    else if (response.statusCode == 400) {
      return response;
    }

    if (response.isOk) {
      return response;
    } else {
      if (status.isServerError) {
        showError(ApiError());
      } else if (status.code == HttpStatus.requestTimeout) {
        showError(ApiError(
          type: ErrorType.connectTimeout,
          error: Strings.connectionTimeout,
        ));
      } else if (response.unauthorized) {
        showError(ApiError(
          type: ErrorType.unAuthorize,
          error: res['message']?.toString() ?? Strings.unauthorized,
        ));
      } else {
        showError(ApiError(
          type: ErrorType.response,
          error: res['message']?.toString() ?? res['error']?.toString() ?? Strings.unknownError,
        ));
      }
    }
  } on FormatException {
    showError(ApiError(
      type: ErrorType.unknownError,
      error: Strings.unknownError,
    ));
  } on TimeoutException catch (e) {
    showError(ApiError(
      type: ErrorType.connectTimeout,
      error: e.message?.toString() ?? Strings.connectionTimeout,
    ));
  }
}

FutureOr showError(ApiError error) {
  return Future.error(error);
}
