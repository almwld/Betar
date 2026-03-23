/// ÙÙÙØ°Ø¬ Ø§ÙØ±Ø³Ø§ÙØ©
class MessageModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String? senderName;
  final String? senderAvatar;
  final String messageText;
  final String? imageUrl;
  final bool isRead;
  final DateTime createdAt;
  final String? productId;
  final String? productTitle;
  final String? productImage;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    this.senderName,
    this.senderAvatar,
    required this.messageText,
    this.imageUrl,
    this.isRead = false,
    required this.createdAt,
    this.productId,
    this.productTitle,
    this.productImage,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] ?? '',
      senderId: json['sender_id'] ?? '',
      receiverId: json['receiver_id'] ?? '',
      senderName: json['sender_name'],
      senderAvatar: json['sender_avatar'],
      messageText: json['message_text'] ?? '',
      imageUrl: json['image_url'],
      isRead: json['is_read'] ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      productId: json['product_id'],
      productTitle: json['product_title'],
      productImage: json['product_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'sender_name': senderName,
      'sender_avatar': senderAvatar,
      'message_text': messageText,
      'image_url': imageUrl,
      'is_read': isRead,
      'created_at': createdAt.toIso8601String(),
      'product_id': productId,
      'product_title': productTitle,
      'product_image': productImage,
    };
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} Ø³ÙØ©';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} Ø´ÙØ±';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ÙÙÙ';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} Ø³Ø§Ø¹Ø©';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} Ø¯ÙÙÙØ©';
    } else {
      return 'Ø§ÙØ¢Ù';
    }
  }

  bool get hasImage => imageUrl != null && imageUrl!.isNotEmpty;

  String get previewText {
    if (hasImage) {
      return 'ð· ØµÙØ±Ø©';
    }
    return messageText.length > 30
        ? '${messageText.substring(0, 30)}...'
        : messageText;
  }
}

/// ÙÙÙØ°Ø¬ Ø§ÙÙØ­Ø§Ø¯Ø«Ø© (Chat)
class ChatModel {
  final String id;
  final String userId;
  final String userName;
  final String? userAvatar;
  final MessageModel lastMessage;
  final int unreadCount;
  final DateTime updatedAt;
  final String? productId;
  final String? productTitle;
  final String? productImage;

  ChatModel({
    required this.id,
    required this.userId,
    required this.userName,
    this.userAvatar,
    required this.lastMessage,
    this.unreadCount = 0,
    required this.updatedAt,
    this.productId,
    this.productTitle,
    this.productImage,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      userName: json['user_name'] ?? '',
      userAvatar: json['user_avatar'],
      lastMessage: MessageModel.fromJson(json['last_message'] ?? {}),
      unreadCount: json['unread_count'] ?? 0,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
      productId: json['product_id'],
      productTitle: json['product_title'],
      productImage: json['product_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_name': userName,
      'user_avatar': userAvatar,
      'last_message': lastMessage.toJson(),
      'unread_count': unreadCount,
      'updated_at': updatedAt.toIso8601String(),
      'product_id': productId,
      'product_title': productTitle,
      'product_image': productImage,
    };
  }

  bool get hasUnread => unreadCount > 0;
}

/// ÙÙÙØ°Ø¬ Ø§ÙØ¥Ø´Ø¹Ø§Ø±
class NotificationModel {
  final String id;
  final String? userId;
  final String title;
  final String body;
  final Map<String, dynamic>? data;
  final bool isRead;
  final DateTime createdAt;
  final String type; // 'order', 'message', 'offer', 'system'

  NotificationModel({
    required this.id,
    this.userId,
    required this.title,
    required this.body,
    this.data,
    this.isRead = false,
    required this.createdAt,
    this.type = 'system',
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      userId: json['user_id'],
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      data: json['data'],
      isRead: json['is_read'] ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      type: json['type'] ?? 'system',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'body': body,
      'data': data,
      'is_read': isRead,
      'created_at': createdAt.toIso8601String(),
      'type': type,
    };
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} Ø³ÙØ©';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} Ø´ÙØ±';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ÙÙÙ';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} Ø³Ø§Ø¹Ø©';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} Ø¯ÙÙÙØ©';
    } else {
      return 'Ø§ÙØ¢Ù';
    }
  }

  IconType get iconType {
    switch (type) {
      case 'order':
        return IconType.shopping;
      case 'message':
        return IconType.message;
      case 'offer':
        return IconType.offer;
      default:
        return IconType.info;
    }
  }
}

enum IconType { shopping, message, offer, info }