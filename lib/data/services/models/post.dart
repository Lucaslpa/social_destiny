class PostApi {
  String id;
  int userId;
  String content;
  String image;
  int likes;
  String createdAt;

  PostApi({
    required this.id,
    required this.userId,
    required this.content,
    required this.image,
    required this.likes,
    required this.createdAt,
  });

  factory PostApi.fromJson(Map<String, dynamic> json) {
    return PostApi(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      image: json['image'] ?? "",
      likes: json['likes'],
      createdAt: json['createdAt'],
    );
  }
}
