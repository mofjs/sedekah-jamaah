
class BlogPost {
  final int id;
  final DateTime date;
  final String link;
  final String slug;
  final String title;
  final String excerpt;
  final String content;

  BlogPost({this.id, this.date, this.link, this.slug, this.title, this.excerpt, this.content});

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'],
      date: DateTime.parse(json['date']),
      link: json['link'],
      slug: json['slug'],
      title: json['title']['rendered'],
      excerpt: json['excerpt']['rendered'],
      content: json['content']['rendered'],
    );
  }
}