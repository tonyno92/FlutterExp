import 'package:flutter/material.dart';

import '../../domain/repository/post_repository.dart';
import '../../domain/model/Post.dart';

class PostList extends StatefulWidget {
  final postRepository = PostRepository();

  PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late final Future<List<Post>> futurePost;

  @override
  void initState() {
    futurePost = widget.postRepository.retrivePosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: widget.postRepository.retrivePosts(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const CircularProgressIndicator()
              : snapshot.data?.isNotEmpty ?? false
                  ? createList(snapshot.data)
                  : const Text("no data available"));

  createList(List<Post>? posts) => posts?.isEmpty ?? false
      ? const Text("no data available")
      : ListView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) => PostItemView(posts.elementAt(index)),
          itemCount: posts!.length,
        );
}

class PostItemView extends StatelessWidget {
  final Post post;
  const PostItemView(this.post, {super.key});

  @override
  Widget build(BuildContext context) => ListTile(
      hoverColor: Colors.deepPurple,
      leading: const Icon(Icons.article),
      trailing: Text("Aurthor : ${post.userId}"),
      title: Text(
        "${post.title}",
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("${post.body}", style: const TextStyle(fontSize: 10)));
}
