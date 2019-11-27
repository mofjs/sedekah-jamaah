import 'package:flutter/material.dart';
import 'package:sedekah_jamaah/screens/home/news.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Sedekah Jama\'ah'),
            expandedHeight: 100.0,
          ),
          HomeNews()
        ],
      ),
    );
  }
}
