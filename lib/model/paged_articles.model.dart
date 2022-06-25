import 'package:scrapi/model/article.model.dart';

class PagedArticlesModel {
  final int count;
  final List<ArticleModel> data;

  const PagedArticlesModel({
    required this.count,
    required this.data
  });
}