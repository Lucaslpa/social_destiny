import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_destiny/config/dependencies.dart';
import 'package:social_destiny/data/repositories/post/post_repositorie_remote.dart';
import 'package:social_destiny/data/services/app_gateway.dart';
import 'package:social_destiny/ui/postListSceen/post_list_screen.dart';
import 'package:social_destiny/ui/postListSceen/post_list_screen_view_model.dart';

void main() {
  runApp(MultiProvider(providers: providersRemote, child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = PostListScreenViewModel(
      postRepositoryRemote: context.read(),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PostListScreen(viewModel: viewModel),
    );
  }
}
