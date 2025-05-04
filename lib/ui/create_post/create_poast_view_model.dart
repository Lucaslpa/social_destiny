import 'package:social_destiny/data/repositories/models/post.dart';
import 'package:social_destiny/data/repositories/post/post_repositorie_remote.dart';
import 'package:social_destiny/utils/command.dart';
import 'package:social_destiny/utils/result.dart';

class CreatePostArgs {
  final String content;
  final String urlImg;

  CreatePostArgs({required this.content, required this.urlImg});
}

class CreatePostViewModel {
  final PostRepositoryRemote postRepositoryRemote;

  late final Command1<void, CreatePostArgs> createPostCommand;

  CreatePostViewModel({required this.postRepositoryRemote}) {
    createPostCommand = Command1<void, CreatePostArgs>(_createPost);
  }

  Future<Result<void>> _createPost(CreatePostArgs args) async {
    final post = Post(
      id: '',
      userId: 3,
      content: args.content,
      image: args.urlImg,
      likes: 0,
      createdAt: DateTime.now(),
    );
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 2));
    final result = await postRepositoryRemote.createPost(post);
    if (result is ApiSuccess<void>) {
      return Result.success(null);
    }
    if (result is ApiError<List<Post>>) {
      return Result.error(result.message);
    }
    return Result.error('Unknown error');
  }
}
