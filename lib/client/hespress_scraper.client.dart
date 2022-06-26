import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scrapi/model/article.model.dart';
import 'package:scrapi/model/category.model.dart';
import 'package:scrapi/model/paged_articles.model.dart';

class HespressScraperClient {
  static String base_url = "https://press-scarper.oaztech.com";

  static Future<List<CategoryModel>> fetchCategories() async {
    final response =
        await http.get(Uri.parse(base_url + '/hespress/categorises'));

    if (response.statusCode == 200) {
      var strJson = utf8.decode(response.bodyBytes);

      return (jsonDecode(strJson) as Iterable)
          .map((categoryJson) => CategoryModel.fromJson(categoryJson)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<int> fetchCategoryId(String categorySlug) async {
    final response = await http
        .get(Uri.parse(base_url + '/hespress/get-category-id/' + categorySlug));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load category id');
    }
  }

  static Future<PagedArticlesModel> fetchBrefArticles(
      {required String categorySlug, int page = 1}) async {
    final response = await http.get(Uri.parse(base_url +
        '/hespress/articles/bref?category_slug=' +
        categorySlug +
        '&page=' +
        page.toString()));

    if (response.statusCode == 200) {
      var strJson = utf8.decode(response.bodyBytes);
      Map<String, dynamic> pagedArticlesJson = jsonDecode(strJson);

      return PagedArticlesModel(
          count: pagedArticlesJson['count'],
          data: (pagedArticlesJson['data'] as List)
              .map((brefArticle) => ArticleModel.fromJson(brefArticle))
              .cast<ArticleModel>()
              .toList());
    } else {
      throw Exception('Failed to load bref of articles');
    }
  }

  static Future<ArticleModel> fetchArticle(int id) async {
    final response = await http
        .get(Uri.parse(base_url + '/hespress/articles/' + id.toString()));

    if (response.statusCode == 200) {
      var strJson = utf8.decode(response.bodyBytes);
      return ArticleModel.fromJson(jsonDecode(strJson));
    } else {
      throw Exception('Failed to load article');
    }
  }
}
