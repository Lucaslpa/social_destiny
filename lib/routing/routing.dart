import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:social_destiny/ui/create_post/create_poast_view_model.dart';
import 'package:social_destiny/ui/create_post/create_post_screen.dart';
import 'package:social_destiny/ui/post_list/post_list_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/posts',

  routes: [
    GoRoute(
      path: '/posts',
      builder: (context, state) {
        return PostListScreen(viewModel: context.read());
      },
    ),
    GoRoute(
      path: '/create-post',
      builder: (context, state) {
        final createPostViewModel = CreatePostViewModel(
          postRepositoryRemote: context.read(),
        );
        return CreatePostScreen(viewModel: createPostViewModel);
      },
    ),
  ],
);
