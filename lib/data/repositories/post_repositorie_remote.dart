import 'package:social_destiny/data/repositories/models/post.dart';
import 'package:social_destiny/data/repositories/post_repositorie.dart';
import 'package:social_destiny/data/services/app_gateway.dart';
import 'package:social_destiny/data/services/models/post.dart';
import 'package:social_destiny/utils/result.dart';

class PostRepositoryRemote implements PostRepository {
  final AppGateway _appGateway;

  PostRepositoryRemote({required AppGateway appGateway})
    : _appGateway = appGateway;

  @override
  Future<String> createPost(String title, String body) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<String> deletePost(String id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<String> getPost(String id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Post>>> getPosts() async {
    final result = await _appGateway.postsGateway.getPosts();
    switch (result) {
      case ApiSuccess<List<PostApi>>():
        return Result.success(
          result.data
              .map(
                (e) => Post(
                  id: e.id,
                  userId: e.userId,
                  content: e.content,
                  image: e.image,
                  likes: e.likes,
                  createdAt: DateTime.parse(e.createdAt),
                ),
              )
              .toList(),
        );
      case ApiError<List<PostApi>>():
        return Result.error(result.message);
    }
  }

  @override
  Future<String> updatePost(String id, String title, String body) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
