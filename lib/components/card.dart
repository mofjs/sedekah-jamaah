import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sedekah_jamaah/models/blog.dart';
import 'package:sedekah_jamaah/services/blog.dart';

class BlogPostCard extends StatelessWidget {

  final BlogPost post;

  BlogPostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FutureBuilder<BlogMedia>(
          future: BlogService().fetchMedia(post.featuredMedia),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Image.network(snapshot.data.thumbnail.sourceUrl);
            }
            return Icon(Icons.image);
          },
        ),
        title: Html(data: post.title,),
        subtitle: Html(data: post.excerpt,),
      ),
    );
  }
}