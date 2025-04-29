import 'package:flutter/material.dart';
import 'package:social_destiny/data/repositories/post_repositorie_remote.dart';
import 'package:social_destiny/data/services/app_gateway.dart';
import 'package:social_destiny/ui/postListSceen/post_list_screen.dart';
import 'package:social_destiny/ui/postListSceen/post_list_screen_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final postRepositoryRemote = PostRepositoryRemote(
      appGateway: AppGateway(url: "http://10.0.2.2:3000"),
    );
    final viewModel = PostListScreenViewModel(
      postRepositoryRemote: postRepositoryRemote,
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
