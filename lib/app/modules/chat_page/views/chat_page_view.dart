import 'package:jumping_dot/jumping_dot.dart';
import 'package:resumedemo/app/common/util/exports.dart';

import '../../../models/chat.dart';
import '../controllers/chat_page_controller.dart';

class ChatPageView extends GetView<ChatPageController> {
  const ChatPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        centerTitle: true,
        backgroundColor: AppColors.colorPrimary,
      ),
      body: Column(
        children: [
          Expanded(child: _showMsg),
          _typing,
          _msgField,
        ],
      ),
    );
  }

  Widget get _showMsg => Container(
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    child: Obx(() => controller.chats.isEmpty? _startChatHints : _allMsg),
  );

  Widget get _allMsg => Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    child: ListView.builder(
      itemCount: controller.chats.length,
        reverse: true,
        itemBuilder: (context, index){
      return _msg(controller.chats[index]);
    }),
  );

  Widget _msg (Chat chat) => Align(
    alignment: chat.from == 0? Alignment.centerLeft : Alignment.centerRight,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: chat.from == 0? AppColors.colorTextSecondary : AppColors.colorPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(chat.msg, style: const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),),
    ),
  );

  Widget get _startChatHints => GestureDetector(
    onTap: controller.onImageTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppAssets.image.icon, height: 60, width: 60),
        const SizedBox(height: 15),
        Text("Say hi to start chat".toUpperCase(), style: const TextStyle(
          color: Colors.black54,
          wordSpacing: 5,
          fontSize: 12,
        ),),
      ],
    ),
  );

  Widget get _typing => Obx(
    ()=> Visibility(
      visible: controller.waitForReply.value,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 100,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const JumpingDots(
            color: AppColors.colorPrimary,
            radius: 5,
            numberOfDots: 3,
            animationDuration: Duration(milliseconds: 100),
          ),
        ),
      ),
    ),
  );

  Widget get _msgField => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Obx(
          () => TextField(
            controller: controller.tecMsg.value,
            decoration: Style.other.chatInputDecoration.copyWith(
              suffixIcon: IconButton(
                onPressed: controller.sendMsgPressed,
                icon: const Icon(
                  Icons.send,
                  color: AppColors.colorPrimary,
                ),
              ),
            ),
          ),
        ),
      );
}
