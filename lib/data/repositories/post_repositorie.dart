import 'package:social_destiny/data/repositories/models/post.dart';
import 'package:social_destiny/utils/result.dart';

abstract class PostRepository {
  Future<Result<List<Post>>> getPosts();
  Future<String> getPost(String id);
  Future<String> createPost(String title, String body);
  Future<String> updatePost(String id, String title, String body);
  Future<String> deletePost(String id);
}
