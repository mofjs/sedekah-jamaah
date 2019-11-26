import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sedekah_jamaah/models/blog.dart';

class BlogService {
  final baseUrl = 'https://www.sedekahjamaah.com/wp-json/wp/v2/';
  
  Future<List<BlogPost>> fetchPosts() async {
    final response = await http.get(baseUrl + 'posts');
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
        .map((json) => BlogPost.fromJson(json))
        .toList();
    } else {
      return null;
    }
  }

  Future<BlogMedia> fetchMedia(int id) async {
    final response = await http.get(baseUrl + 'media/' + id.toString());
    if (response.statusCode == 200) {
      return BlogMedia.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}