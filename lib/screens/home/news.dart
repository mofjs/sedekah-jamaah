import 'package:flutter/material.dart';
import 'package:sedekah_jamaah/components/card.dart';
import 'package:sedekah_jamaah/models/blog.dart';
import 'package:sedekah_jamaah/services/blog.dart';

class HomeNews extends StatefulWidget {
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  Future<List<BlogPost>> posts;

  @override
  initState() {
    super.initState();
    posts = _fetchPostAndMedia();
  }

  Future<List<BlogPost>> _fetchPostAndMedia() async {
    List<BlogPost> posts = await BlogService().fetchPosts();
    posts.forEach((post) async {
      post.featuredMedia = await BlogService().fetchMedia(post.featuredMediaId);
    });
    return posts;
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<BlogPost>>(
      future: posts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return BlogPostCard(snapshot.data[index]);
            }, childCount: snapshot.data.length),
          );
        }
        if (snapshot.hasError) {
          return SliverFixedExtentList(
            delegate: SliverChildListDelegate([
              Text('${snapshot.error}')
            ]),
            itemExtent: 200.0,
          );
        }
        return SliverFillViewport(
          delegate: SliverChildListDelegate([
            CircularProgressIndicator()
          ]),
        );
      },
    );
  }
}
