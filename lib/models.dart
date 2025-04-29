class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final String avatar;
  final String bio;
  final DateTime createdAt;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.avatar,
    required this.bio,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      bio: json['bio'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Post {
  final String id;
  final int userId;
  final String content;
  final String? image;
  final int likes;
  final DateTime createdAt;

  Post({
    required this.id,
    required this.userId,
    required this.content,
    this.image,
    required this.likes,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      image: json['image'],
      likes: json['likes'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Comment {
  final int id;
  final int postId;
  final int userId;
  final String content;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      postId: json['postId'],
      userId: json['userId'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Like {
  final int id;
  final int postId;
  final int userId;
  final DateTime createdAt;

  Like({
    required this.id,
    required this.postId,
    required this.userId,
    required this.createdAt,
  });

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      id: json['id'],
      postId: json['postId'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Follow {
  final int id;
  final int followerId;
  final int followingId;
  final DateTime createdAt;

  Follow({
    required this.id,
    required this.followerId,
    required this.followingId,
    required this.createdAt,
  });

  factory Follow.fromJson(Map<String, dynamic> json) {
    return Follow(
      id: json['id'],
      followerId: json['followerId'],
      followingId: json['followingId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Notification {
  final int id;
  final int userId;
  final String type;
  final int actorId;
  final int? targetId;
  final bool read;
  final DateTime createdAt;

  Notification({
    required this.id,
    required this.userId,
    required this.type,
    required this.actorId,
    this.targetId,
    required this.read,
    required this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      userId: json['userId'],
      type: json['type'],
      actorId: json['actorId'],
      targetId: json['targetId'],
      read: json['read'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Message {
  final int id;
  final int senderId;
  final int receiverId;
  final String content;
  final bool read;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.read,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      content: json['content'],
      read: json['read'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
