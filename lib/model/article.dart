class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  final String content;
  final String sourceName;
  final bool isFavorite;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.content,
    required this.sourceName,
    this.isFavorite = false,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'nothing',
      description: json['description'] ?? 'nothing',
      url: json['url'] ?? 'sorry',
      content: json['content'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      sourceName: json['source']['name'],
    );
  }
}
