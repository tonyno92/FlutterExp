import 'package:flutter/material.dart';

import '../../domain/model/Post.dart';

class PostItemView extends StatelessWidget {
  final Post post;
  const PostItemView(this.post, {super.key});

  @override
  Widget build(
          BuildContext
              context) => /* Card(

        child: Column(
            children: [Text("${post.title}"), Text("Author : ${post.userId}")]),
      ); */
      ListTile(
          hoverColor: Colors.deepPurple,
          leading: const Icon(Icons.article),
          title: Text(
            "${post.title}",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "${post.body}",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
          trailing: Text("Aurthor : ${post.userId}"));
}
