class MessageModel {
  final int id;
  final bool fromMe;
  final String type;
  final String time;
  final String? message;
  final String? image;
  final String? sticker;
  final String? audio;
  final bool isRead;
  final bool isStar;

  const MessageModel({
    required this.id,
    required this.fromMe,
    required this.type,
    required this.time,
    required this.message,
    required this.image,
    required this.sticker,
    required this.audio,
    required this.isRead,
    required this.isStar,
  });
}

class ChatModel {
  final int id;
  final String photo;
  final String name;
  final String bio;
  final String phoneNumber;
  final List<MessageModel> messages;
  final bool isMuted;
  final bool isPinned;

  const ChatModel({
    required this.id,
    required this.photo,
    required this.name,
    required this.bio,
    required this.phoneNumber,
    required this.isMuted,
    required this.messages,
    required this.isPinned,
  });
}
