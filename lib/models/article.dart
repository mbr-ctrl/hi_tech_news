class Article {
  final String title;
  final String? urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.title,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      urlToImage: json['urlToImage'] ?? 'https://firebasestorage.googleapis.com/v0/b/village-noah-app.appspot.com/o/htn%2Fimage_nf.jpg?alt=media&token=39ab05cc-7ece-48f8-adae-eb49cc31407e',
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt']).toLocal()
          : DateTime.now(),
      content: json['content'] ?? ''
    );
  }
}
