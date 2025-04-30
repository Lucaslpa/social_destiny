import 'package:flutter/material.dart';
import 'package:social_destiny/data/repositories/models/post.dart';
import 'package:social_destiny/ui/postListSceen/post_list_screen_view_model.dart';

class PostListScreen extends StatefulWidget {
  final PostListScreenViewModel viewModel;

  const PostListScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    await widget.viewModel.getPostsCommand.execute();
    setState(
      () {},
    ); // Atualiza o estado para reconstruir o widget após carregar os posts
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = widget.viewModel.getPostsCommand.running;

    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : widget.viewModel.posts.isEmpty
              ? Center(child: Text('Nenhum post encontrado'))
              : ListView.builder(
                itemCount: widget.viewModel.posts.length,
                itemBuilder: (context, index) {
                  return PostCard(post: widget.viewModel.posts[index]);
                },
              ),
    );
  }
}

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int likes;

  @override
  void initState() {
    super.initState();
    likes = widget.post.likes;
  }

  void _incrementLikes() {
    setState(() {
      likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.post.image.isNotEmpty) Image.network(widget.post.image),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.post.content),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.post.createdAt.toString()),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite),
                        color: Colors.red,
                        onPressed: _incrementLikes,
                      ),
                      Text(likes.toString()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
