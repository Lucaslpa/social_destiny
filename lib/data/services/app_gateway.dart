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
}

class AppGateway {
  final Posts postsGateway;
  AppGateway({required String url}) : postsGateway = Posts(url: url);
}
