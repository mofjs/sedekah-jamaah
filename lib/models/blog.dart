
class BlogPost {
  final int id;
  final DateTime date;
  final String link;
  final String slug;
  final String title;
  final String excerpt;
  final String content;
  final int featuredMedia;

  BlogPost({this.id, this.date, this.link, this.slug, this.title, this.excerpt, this.content, this.featuredMedia});

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'],
      date: DateTime.parse(json['date']),
      link: json['link'],
      slug: json['slug'],
      title: json['title']['rendered'],
      excerpt: json['excerpt']['rendered'],
      content: json['content']['rendered'],
      featuredMedia: json['featured_media'],
    );
  }
}

class MediaDetail {
  final String file;
  final int height;
  final int width;
  final String mimeType;
  final String sourceUrl;

  MediaDetail({this.file, this.height, this.width, this.mimeType, this.sourceUrl});

  factory MediaDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return MediaDetail(
      file: json['file'],
      height: json['height'],
      width: json['width'],
      mimeType: json['mime_type'],
      sourceUrl: json['source_url']
    );
  }
}

class BlogMedia {
  final int id;
  final String mediaType;
  final MediaDetail thumbnail;
  final MediaDetail medium;
  final MediaDetail large;

  BlogMedia({this.id, this.mediaType, this.thumbnail, this.medium, this.large});

  factory BlogMedia.fromJson(Map<String, dynamic> json) {
    return BlogMedia(
      id: json['id'],
      mediaType: json['media_type'],
      thumbnail: MediaDetail.fromJson(json['media_details']['sizes']['thumbnail']),
      medium: MediaDetail.fromJson(json['media_details']['sizes']['medium']),
      large: MediaDetail.fromJson(json['media_details']['sizes']['large']),
    );
  }
}