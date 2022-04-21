import 'package:get/get.dart';

abstract class ChatApiHelper {
  Future<Response> getChatReply(String msg);
}
