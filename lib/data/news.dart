class News {
  final String title;
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  News(
      {this.title,
      this.author,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory News.formJason(Map<String, dynamic> json) {
    return News(
        title: json["title"],
        author: json["author"],
        content: json["content"],
        description: json["description"],
        publishedAt: json["publishedAt"],
        urlToImage: json["urlToImage"],
        url: json["url"]);
  }
}
