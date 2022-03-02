class News {
  String? title;
  String? author;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

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
