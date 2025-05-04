import 'package:social_destiny/data/repositories/models/post.dart';
import 'package:social_destiny/utils/result.dart';

abstract class PostRepository {
  Future<Result<List<Post>>> getPosts();
  Future<String> getPost(String id);
  Future<Result<void>> createPost(Post post);
  Future<Result<void>> updatePost(Post post);
  Future<String> deletePost(String id);
}
