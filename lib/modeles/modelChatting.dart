class Message {
  String? messageId;
  final String? senderId;
  final String? message;
  final DateTime? time;

  Message({
    this.messageId,
    this.senderId,
    this.message,
    this.time,
  });
  Map<String, dynamic> toJson() => {
        'message': message,
        'senderId': senderId,
        'time': time,
      };
}
