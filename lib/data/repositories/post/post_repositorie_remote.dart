import 'package:social_destiny/data/repositories/models/post.dart';
import 'package:social_destiny/data/repositories/post/post_repositorie.dart';
import 'package:social_destiny/data/services/app_gateway.dart';
import 'package:social_destiny/data/services/models/post_api.dart';
import 'package:social_destiny/utils/result.dart';

class PostRepositoryRemote implements PostRepository {
  final AppGateway _appGateway;

  PostRepositoryRemote({required AppGateway appGateway})
    : _appGateway = appGateway;

  @override
  Future<Result<void>> createPost(Post post) {
    final postApi = PostApi(
      id: post.id,
      userId: post.userId,
      content: post.content,
      image: post.image,
      likes: post.likes,
      createdAt: post.createdAt.toIso8601String(),
    );
    return _appGateway.postsGateway.createPost(postApi).then((result) {
      switch (result) {
        case ApiSuccess<void>():
          return result;
        case ApiError<void>():
          return Result.error(result.message);
      }
    });
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
  Future<Result<void>> updatePost(Post post) async {
    final postApi = PostApi(
      id: post.id,
      userId: post.userId,
      content: post.content,
      image: post.image,
      likes: post.likes,
      createdAt: post.createdAt.toIso8601String(),
    );
    final result = await _appGateway.postsGateway.updatePost(postApi);
    switch (result) {
      case ApiSuccess<void>():
        return Result.success(null);
      case ApiError<void>():
        return Result.error(result.message);
    }
  }
}

class PostRepositoryLocal implements PostRepository {
  final AppGateway _appGateway;

  PostRepositoryLocal({required AppGateway appGateway})
    : _appGateway = appGateway;

  @override
  Future<Result<void>> createPost(Post post) {
    final postApi = PostApi(
      id: post.id,
      userId: post.userId,
      content: post.content,
      image: post.image,
      likes: post.likes,
      createdAt: post.createdAt.toIso8601String(),
    );
    return _appGateway.postsGateway.createPost(postApi).then((result) {
      switch (result) {
        case ApiSuccess<void>():
          return result;
        case ApiError<void>():
          return Result.error(result.message);
      }
    });
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
    final Result<List<PostApi>> result = Result.success([
      PostApi(
        id: "10",
        userId: 10,
        content: "heuehe",
        image: "",
        likes: 10,
        createdAt: DateTime.now().toIso8601String(),
      ),
    ]);

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
  Future<Result<void>> updatePost(Post post) async {
    final postApi = PostApi(
      id: post.id,
      userId: post.userId,
      content: post.content,
      image: post.image,
      likes: post.likes,
      createdAt: post.createdAt.toIso8601String(),
    );
    final result = await _appGateway.postsGateway.updatePost(postApi);
    switch (result) {
      case ApiSuccess<void>():
        return Result.success(null);
      case ApiError<void>():
        return Result.error(result.message);
    }
  }
}
