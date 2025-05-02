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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: AnimatedBuilder(
        animation: widget.viewModel.getPostsCommand,
        builder: (context, _) {
          final isLoading = widget.viewModel.getPostsCommand.running;
          final posts = widget.viewModel.posts;

          if (isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (posts.isEmpty) {
            return Center(child: Text('Nenhum post encontrado'));
          }
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostCard(
                post: posts[index],
                onLike:
                    (post) => widget.viewModel.likePostCommand.execute(post),
              );
            },
          );
        },
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final Post post;
  final Function(Post) onLike;

  const PostCard({Key? key, required this.post, required this.onLike})
    : super(key: key);

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
    widget.onLike(widget.post);
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
