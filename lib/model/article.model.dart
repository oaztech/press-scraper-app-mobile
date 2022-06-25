class ArticleModel {
  final int? id;
  final String? title;
  final String? image;
  final String? url;
  final String? author;
  final String? content;
  final String? createdAt;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.image,
    required this.author,
    required this.url,
    required this.content,
    required this.createdAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {

    return ArticleModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      url: json['url'],
      author: json['author'],
      content: json['content'],
      createdAt: json['created_at'],
    );
  }
}