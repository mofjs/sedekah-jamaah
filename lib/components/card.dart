import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sedekah_jamaah/models/blog.dart';

class BlogPostCard extends StatelessWidget {

  final BlogPost post;

  BlogPostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: post.featuredMedia != null && post.featuredMedia.thumbnail != null ?
          Image.network(post.featuredMedia.thumbnail.sourceUrl) :
          Icon(Icons.image),
        title: Html(data: post.title,),
        subtitle: Html(data: post.excerpt,),
      ),
    );
  }
}