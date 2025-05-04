import 'package:social_destiny/utils/date.dart';

class Post {
  String id;
  int userId;
  String content;
  String image;
  int likes;
  DateTime createdAt;

  Post({
    required this.id,
    required this.userId,
    required this.content,
    required this.image,
    required this.likes,
    required this.createdAt,
  });

  void like() {
    likes++;
  }

  void unlike() {
    likes--;
  }

  get createdAtFormatted => DateUtils.formatDate(createdAt.toIso8601String());

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      image: json['image'],
      likes: json['likes'],
      createdAt: json['createdAt'],
    );
  }
}
