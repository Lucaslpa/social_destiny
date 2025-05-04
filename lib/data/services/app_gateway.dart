import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_destiny/data/services/models/post_api.dart';
import 'package:social_destiny/utils/result.dart';

class Posts {
  final String url;
  Posts({required this.url});

  Future<Result<List<PostApi>>> getPosts() async {
    try {
      final response = await http.get(Uri.parse('$url/posts'));
      if (response.statusCode == 200) {
        List<PostApi> postApiList =
            (jsonDecode(response.body) as List)
                .map((data) => PostApi.fromJson(data))
                .toList();
        return Result.success(postApiList);
      }
      return Result.error("Failed to get posts");
    } catch (e) {
      return Result.error("Failed to get posts");
    }
  }

  Future<Result<PostApi>> getPost(String id) async {
    final response = await http.get(Uri.parse('$url/posts/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Result.success(PostApi.fromJson(data));
    }
    return Result.error("Failed to get post");
  }

  Future<Result<void>> updatePost(PostApi post) async {
    final response = await http.put(
      Uri.parse('$url/posts/${post.id}'),
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode == 200) {
      return Result.success(null);
    }
    return Result.error("Failed to updatePost post");
  }

  Future<Result<void>> deletePost(String id) async {
    final response = await http.delete(Uri.parse('$url/posts/$id'));
    if (response.statusCode == 200) {
      return Result.success(null);
    }
    return Result.error("Failed to delete post");
  }

  Future<Result<void>> createPost(PostApi post) async {
    final response = await http.post(
      Uri.parse('$url/posts'),
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode == 201) {
      return Result.success(null);
    }
    return Result.error("Failed to create post");
  }
}

class AppGateway {
  final Posts postsGateway;
  AppGateway({required String url}) : postsGateway = Posts(url: url);
}
