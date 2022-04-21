
import 'package:resumedemo/app/common/util/exports.dart';

import '../../../data/chat_api_helper.dart';
import '../../../models/chat.dart';

class ChatPageController extends GetxController {

  final ChatApiHelper _chatApiHelper = Get.find();

  RxList<Chat> chats = <Chat>[].obs;

  RxBool waitForReply = false.obs;

  var tecMsg = TextEditingController().obs;
  var tecToken = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onImageTap() {
    _sendMsg("Hi");
  }

  void sendMsgPressed() {
    if(tecMsg.value.text.trim().isEmpty) {
      Utils.showSnackbar("emptyMsg".tr);
    } else {
      _sendMsg(tecMsg.value.text.trim());
    }
  }

  Future<void> _sendMsg(String msg) async {
    chats.insert(0, Chat(msg, 1));
    chats.refresh();

    tecMsg.value.clear();

    await _getReply(msg);
  }

  Future<void> _getReply(String msg) async {
    // sample response
    // {
    //   "status":200,
    //    "statusMessage":"Ok",
    //    "atext":"Hello it is a pleasure to meet you!",
    //    "lang":"en",
    //    "request":{
    //        "utext":"hello",
    //        "lang":"en"
    //    }
    // }
    waitForReply.value = true;

    await _chatApiHelper.getChatReply(msg).then((value) {
      if(value.statusCode == 200) {
        chats.insert(0, Chat(value.body["atext"], 0));
      } else {
        Helper.unFocus;
        _setNewToken();
      }
    });

    waitForReply.value = false;
  }

  void _setNewToken() {
    Get.bottomSheet(
      Card(
        child: Container(
          height: 300,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Invalid Simsimi API token",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 30,
                ),
                child: TextField(
                    controller: tecToken.value,
                    decoration: Style.other.inputDecoration.copyWith(
                      labelText: "New Api token",
                    )
                  ),
              ),

              const Spacer(),

              SizedBox(
                width: Get.width / 2,
                child: ElevatedButton(
                  onPressed: _updateToken,
                  child: Text("update".tr.toUpperCase()),
                  style: Style.buttonStyle.darkBg,
                ),
              ),

            ],
          ),
        ),
      ),
      barrierColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
    );
  }

  void _updateToken() {
    StorageHelper.setChatToken = tecToken.value.text.trim();
    tecToken.value.clear();
    Helper.unFocus;
    Get.back();
  }

}

