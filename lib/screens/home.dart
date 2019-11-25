import 'package:flutter/material.dart';
import 'package:sedekah_jamaah/components/card.dart';
import 'package:sedekah_jamaah/models/blog.dart';
import 'package:sedekah_jamaah/services/blog.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sedekah Jama\'ah'),
        backgroundColor: Colors.lightGreen[400],
      ),
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[HomeBerita()],
        ),
      ),
    );
  }
}

class HomeBerita extends StatefulWidget {
  @override
  _HomeBeritaState createState() => _HomeBeritaState();
}

class _HomeBeritaState extends State<HomeBerita> {
  Future<List<BlogPost>> posts;

  @override
  void initState() {
    super.initState();
    posts = BlogService().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BlogPost>>(
      future: posts,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            alignment: Alignment.center,
            child: Text("${snapshot.error}"),
          );
        }
        if (snapshot.hasData) {
          return Expanded(
              child: ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) => BlogPostCard(snapshot.data[index]),
            separatorBuilder: (context, index) => Divider(),
          ));
        }

        return Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
