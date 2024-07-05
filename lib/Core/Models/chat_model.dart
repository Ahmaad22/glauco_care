class ChatModel {
  String? id;
  String? name;
  List<ChatUserModel>? users;
  List<MessageModel>? messages;

  ChatModel({this.id, this.name, this.users, this.messages});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['_id'],
      name: json['name'],
      users: json['users'] != null
          ? List<ChatUserModel>.from(
              json['users'].map((user) => ChatUserModel.fromJson(user)))
          : null,
      messages: json['messages'] != null
          ? List<MessageModel>.from(
              json['messages'].map((message) => MessageModel.fromJson(message)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'users':
          users != null ? users!.map((user) => user.toJson()).toList() : null,
      'messages': messages != null
          ? messages!.map((message) => message.toJson()).toList()
          : null,
    };
  }
}

class ChatUserModel {
  String? id;
  String? email;

  ChatUserModel({this.id, this.email});

  factory ChatUserModel.fromJson(Map<String, dynamic> json) {
    return ChatUserModel(
      id: json['_id'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
    };
  }
}

class MessageModel {
  String? id;
  String? content;
  String? sender;
  String? createdAt;

  MessageModel({this.id, this.content, this.sender, this.createdAt});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        id: json['_id'],
        content: json['content'],
        sender: json['userEmail'],
        createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'content': content,
      'sender': sender,
    };
  }
}
