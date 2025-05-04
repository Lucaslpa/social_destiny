import 'package:social_destiny/data/repositories/models/post.dart';
import 'package:social_destiny/data/repositories/post/post_repositorie_remote.dart';
import 'package:social_destiny/utils/command.dart';
import 'package:social_destiny/utils/result.dart';

class PostListScreenViewModel {
  final PostRepositoryRemote postRepositoryRemote;

  late final Command0 getPostsCommand;
  late final Command1<void, Post> likePostCommand;
  late final Command1<void, Post> unlikePostCommand;
  List<Post> _posts = [];
  List<Post> get posts => _posts;

  PostListScreenViewModel({required this.postRepositoryRemote}) {
    getPostsCommand = Command0(_getPosts);
    likePostCommand = Command1(_likePost);
  }

  Future<Result<void>> _getPosts() async {
    await Future.delayed(Duration(seconds: 2));
    final result = await postRepositoryRemote.getPosts();
    if (result is ApiSuccess<List<Post>>) {
      _posts = result.data;
      return Result.success(null);
    }
    if (result is ApiError<List<Post>>) {
      return Result.error(result.message);
    }
    return Result.error('Unknown error');
  }

  Future<Result<void>> _likePost(Post post) async {
    post.like();
    final result = await postRepositoryRemote.updatePost(post);
    if (result is ApiSuccess<void>) {
      return Result.success(null);
    }
    if (result is ApiError<List<Post>>) {
      return Result.error(result.message);
    }
    return Result.error('Unknown error');
  }
}
