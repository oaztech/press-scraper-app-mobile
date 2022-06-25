class CategoryModel {
  final String wording;
  final String slug;
  final String url;
  final int id;

  const CategoryModel({
    required this.wording,
    required this.slug,
    required this.url,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {

    return CategoryModel(
      wording: json['wording'],
      slug: json['slug'],
      url: json['url'],
      id: json['id'],
    );
  }
}