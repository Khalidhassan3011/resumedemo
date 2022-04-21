class Chat {
  String msg;

  // 0 -> simsimi
  // 1 -> user
  int from;

  Chat(this.msg, this.from);

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        json["msg"],
        json["from"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "from": from,
      };
}
