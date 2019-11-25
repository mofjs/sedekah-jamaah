import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sedekah_jamaah/models/blog.dart';

class BlogPostCard extends StatelessWidget {

  final BlogPost post;

  BlogPostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(post.title),
          Html(data: post.content)
        ],
      ),
    );
  }
}