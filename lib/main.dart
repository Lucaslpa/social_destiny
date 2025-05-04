import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_destiny/config/dependencies.dart';
import 'package:social_destiny/ui/create_post/create_poast_view_model.dart';
import 'package:social_destiny/ui/create_post/create_post_screen.dart';
import 'package:social_destiny/ui/post_list/post_list_screen.dart';
import 'package:social_destiny/ui/post_list/post_list_screen_view_model.dart';

void main() {
  runApp(MultiProvider(providers: providersRemote, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = PostListScreenViewModel(
      postRepositoryRemote: context.read(),
    );

    final createPostViewModel = CreatePostViewModel(
      postRepositoryRemote: context.read(),
    );
    return MaterialApp(
      title: 'Rede social',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PostListScreen(viewModel: viewModel),
    );
  }
}
