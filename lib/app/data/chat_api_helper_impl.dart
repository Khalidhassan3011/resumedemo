import 'dart:async';
import 'dart:convert';

import '../common/util/exports.dart';
import 'chat_api_helper.dart';
import 'interceptor.dart';

class ChatApiHelperImpl extends GetConnect with ChatApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.chatBaseUrl;
    httpClient.timeout = Constants.timeout;

    addRequestModifier();

    httpClient.addResponseModifier(
      (request, response) => interceptor(
        httpClient,
        request,
        response,
      ),
    );
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {

      request.headers["x-api-key"] = Constants.appInfo.simsimiKey;

      printInfo(
        info: 'REQUEST ║ ${request.method.toUpperCase()}\n'
            'url: ${request.url}\n'
            'Headers: ${request.headers}\n'
            'Body: ${request.files?.toString() ?? ''}\n',
      );

      return request;
    });
  }

  @override
  Future<Response> getChatReply(String msg) async {
    return await post("talk",json.encode({
      "utext": msg,
      "lang": "en"
    }));
  }
}